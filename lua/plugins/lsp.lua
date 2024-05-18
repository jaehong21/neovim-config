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
					"html",
					"htmx",
					"templ",
					"tsserver",
					"svelte",
					"eslint",
					--
					"pylsp",
					"gopls",
					"clangd",
					"jdtls", -- Java
					"gradle_ls",
					"rust_analyzer",
					--
					"terraformls",
					"tflint",
					"dockerls",
					"helm_ls",
					--
					"lua_ls",
					"vimls",
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
			local telescope = require("telescope.builtin")

			keyMapper("K", vim.lsp.buf.hover)
			keyMapper("gd", vim.lsp.buf.definition)
			-- keyMapper("gu", vim.lsp.buf.references)
			keyMapper("gu", telescope.lsp_references)
			keyMapper("<leader>ca", vim.lsp.buf.code_action)

			local lspconfig = require("lspconfig")

			lspconfig.html.setup({})
			lspconfig.htmx.setup({})
			lspconfig.templ.setup({})
			lspconfig.deno.setup({})
			lspconfig.svelte.setup({})
			lspconfig.eslint.setup({})
			lspconfig.tsserver.setup({})

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
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			})
			lspconfig.vimls.setup({})
			lspconfig.marksman.setup({})
			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						schemas = {
							kubernetes = "globPattern",
							["https://json.schemastore.org/github-workflow.json"] = "/.*/workflows/*",
							["https://goreleaser.com/static/schema.json"] = ".goreleaser.yaml",
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
