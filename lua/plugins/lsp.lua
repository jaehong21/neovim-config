local keyMapper = require('utils.keymapper').mapKey

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require('mason-lspconfig').setup({
        -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
        ensure_installed = { "lua_ls", "marksman", "jsonls", "yamlls", "bashls", "autotools_ls",
          "tsserver", "gopls", "pylsp", "jdtls", "gradle_ls", "rust_analyzer",
          "terraformls", "dockerls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.marksman.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.yamlls.setup({
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.*/workflows/*",
            }
          }
        }
      })
      lspconfig.bashls.setup({})
      lspconfig.autotools_ls.setup({})

      lspconfig.tsserver.setup({})
      lspconfig.gopls.setup({})
      lspconfig.pylsp.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.gradle_ls.setup({})
      lspconfig.rust_analyzer.setup({})

      lspconfig.terraformls.setup({})
      lspconfig.dockerls.setup({})

      keyMapper('K', vim.lsp.buf.hover)
      keyMapper('gd', vim.lsp.buf.definition)
      keyMapper('<leader>ca', vim.lsp.buf.code_action)
    end
  }
}
