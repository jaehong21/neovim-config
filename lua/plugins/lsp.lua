local keyMapper = require("utils.keymapper").mapKey

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
				ensure_installed = {
					"tsserver",
					--
					"pylsp",
					"gopls",
					"clangd",
					"jdtls", -- Java
					"gradle_ls",
					"rust_analyzer",
					--
					"terraformls",
					"dockerls",
					"helm_ls",
					--
					"lua_ls",
					"marksman",
					"yamlls",
					"jsonls",
					"bashls",
					"autotools_ls", -- Makefile
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- https://github.com/mrjosh/helm-ls/blob/master/examples/nvim/init.lua
			"towolf/vim-helm",
			ft = "helm",
		},
		config = function()
			keyMapper("K", vim.lsp.buf.hover)
			keyMapper("gd", vim.lsp.buf.definition)
			keyMapper("<leader>ca", vim.lsp.buf.code_action)

			local lspconfig = require("lspconfig")

			lspconfig.tsserver.setup({})
			--
			lspconfig.pylsp.setup({})
			lspconfig.gopls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.jdtls.setup({})
			lspconfig.gradle_ls.setup({})
			lspconfig.rust_analyzer.setup({})
			--
			lspconfig.terraformls.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.helm_ls.setup({
				settings = {
					["helm-ls"] = {
						yamlls = {
							path = "yaml-language-server",
						},
					},
				},
			})
			--
			lspconfig.lua_ls.setup({})
			lspconfig.marksman.setup({})
			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						schemas = {
							["https://json.schemastore.org/github-workflow.json"] = "/.*/workflows/*",
						},
					},
				},
			})
			lspconfig.jsonls.setup({})
			lspconfig.bashls.setup({})
			lspconfig.autotools_ls.setup({})
		end,
	},
}
