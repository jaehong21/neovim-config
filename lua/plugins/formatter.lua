return {
  -- {
  -- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
  -- 	config = function()
  -- 		local mason_tool_installer = require("mason-tool-installer")
  -- 		mason_tool_installer.setup({
  -- 			ensure_installed = {
  -- 				"black",
  -- 				"isort",
  -- 				"clang-format",
  -- 				"rustfmt",
  -- 				--
  -- 				"hclfmt",
  -- 				"tflint",
  -- 				--
  -- 				"stylua",
  -- 				"markdownlint",
  -- 				"yamlfmt",
  -- 				"yamllint",
  -- 				"jsonlint",
  -- 			},
  -- 		})
  -- 	end,
  -- },

  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
      lint.linters_by_ft = {
        --
        go = { "golangcilint" },
        --
        terraform = { "tflint" },
        --
        markdown = { "markdownlint" },
        json = { "jsonlint" },
      }

      -- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({
        "BufEnter",
        "BufWritePost",
        "InsertLeave",
      }, {
        callback = function()
          lint.try_lint()
        end,
      })

      -- vim.keymap.set("n", "<leader>l", function()
      -- 	lint.try_lint()
      -- end, { desc = "Trigger linting for current file" })

      -- https://www.reddit.com/r/neovim/comments/19ceuoq/comment/kuna12d
      lint.linters.markdownlint.args = {
        "--disable",
        "MD012",
        "MD013",
        "MD033",
        "--", -- Required
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
      conform.setup({
        formatters_by_ft = {
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescriptreact = { "prettierd" },
          html = { "htmlbeautifier" },
          css = { "prettierd" },
          --
          python = { "black" },
          go = { "gofumpt", "goimports" },
          c = { "clang-format" },
          cpp = { "clang-format" },
          rust = { "rustfmt" },
          --
          hcl = { "hclfmt" },
          terraform = { "terraform_fmt", "hclfmt" },
          --
          lua = { "stylua" },
          markdown = { "markdownlint" },
          yaml = { "yamlfmt" },
        },
        format_after_save = {
          lsp_fallback = true,
          async = true,
          timeout_ms = 500,
        },
      })

      conform.formatters.prettierd = {
        prepend_args = {
          -- "--single-quote",
          "--no-semi",
        },
      }

      conform.formatters.yamlfmt = {
        -- https://github.com/google/yamlfmt/blob/main/docs/command-usage.md
        -- https://github.com/google/yamlfmt/blob/main/docs/config-file.md
        prepend_args = {
          "-formatter",
          "retain_line_breaks_single=true",
          "drop_merge_tag=true",
        },
      }

      conform.formatters.htmlbeautifier = {
        prepend_args = function()
          -- https://github.com/Glavin001/atom-beautify/issues/285#issuecomment-289088405
          return { "--keep-blank-lines", "1" }
        end,
      }

      -- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      --   conform.format({
      --     lsp_fallback = true,
      --     async = false,
      --     timeout_ms = 500,
      --   })
      -- end, { desc = "Format file or range (in visual mode)" })
    end,
  },
}
