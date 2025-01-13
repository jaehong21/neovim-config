local java_filetypes = { "java" }

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "java" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = {},
      },
      setup = {
        jdtls = function()
          return true -- avoid duplicate servers
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
  },

  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "folke/which-key.nvim" },
    ft = java_filetypes,
    opts = function()
      return {
        root_dir = require("lspconfig.configs.jdtls").default_config.root_dir,

        project_name = function(root_dir)
          return root_dir and vim.fs.basename(root_dir)
        end,

        jdtls_config_dir = function(project_name)
          return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
        end,
        jdtls_workspace_dir = function(project_name)
          return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
        end,

        cmd = { vim.fn.exepath("jdtls") },
        full_cmd = function(opts)
          local fname = vim.api.nvim_buf_get_name(0)
          local root_dir = opts.root_dir(fname)
          local project_name = opts.project_name(root_dir)
          local cmd = vim.deepcopy(opts.cmd)
          if project_name then
            local home = os.getenv("HOME")
            local lombok = home .. "/.config/nvim/lua/plugins/lsp/bin/lombok.jar"

            vim.list_extend(cmd, {
              "-configuration",
              opts.jdtls_config_dir(project_name),
              "-data",
              opts.jdtls_workspace_dir(project_name),
              "--jvm-arg=-javaagent:" .. lombok,
              "--jvm-arg=-Dlog.protocol=false",
              "--jvm-arg=-Dlog.level=INFO",
            })
          end
          return cmd
        end,

        dap = { hotcodereplace = "auto", config_overrides = {} },
        dap_main = {},
        test = true,
        settings = {
          java = {
            inlayHints = {
              parameterNames = {
                enabled = "all",
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      vim.b.disable_autoformat = true

      local bundles = {}

      local function extend_or_override(config, custom, ...)
        if type(custom) == "function" then
          config = custom(config, ...) or config
        elseif custom then
          config = vim.tbl_deep_extend("force", config, custom)
        end
        return config
      end

      local function attach_jdtls()
        local fname = vim.api.nvim_buf_get_name(0)

        local config = extend_or_override({
          cmd = opts.full_cmd(opts),
          root_dir = opts.root_dir(fname),
          init_options = {
            bundles = bundles,
          },
          settings = opts.settings,
          capabilities = require("cmp_nvim_lsp").default_capabilities() or nil,
        }, opts.jdtls)

        require("jdtls").start_or_attach(config)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = java_filetypes,
        callback = attach_jdtls,
      })
    end,
  },
}
