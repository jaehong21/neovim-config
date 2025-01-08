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
					"ts_ls",
					"svelte",
					"eslint",
					--
					"pylsp",
					"pyright",
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
					-- "nil_ls",
					--
					"lua_ls",
					"vimls",
					"marksman",
					"yamlls",
					"jsonls",
					"bashls",
				},
			})
		end,
	},
	-- https://github.com/mrjosh/helm-ls/blob/master/examples/nvim/init.lua
	{
		"towolf/vim-helm",
		ft = "helm",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- "b0o/schemastore.nvim",
		},
		config = function()
			local telescope = require("telescope.builtin")

			keyMapper("K", vim.lsp.buf.hover)
			keyMapper("gd", vim.lsp.buf.definition)
			-- keyMapper("gu", vim.lsp.buf.references)
			keyMapper("gu", telescope.lsp_references)
			keyMapper("<leader>ca", vim.lsp.buf.code_action)

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.html.setup({})
			lspconfig.htmx.setup({})
			lspconfig.templ.setup({})
			lspconfig.deno.setup({})
			lspconfig.svelte.setup({})
			lspconfig.eslint.setup({})
			lspconfig.ts_ls.setup({})

			lspconfig.pylsp.setup({
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								enabled = true,
								ignore = { "E501" }, -- Ignore line length warnings
								maxLineLength = 100, -- Set a custom max line length
							},
							pyflakes = {
								enabled = true,
								ignore = { "unknown-attribute" }, -- Ignore unknown attribute warnings
							},
						},
					},
				},
			})
			lspconfig.pyright.setup({})
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
						logLevel = "info",
						valuesFiles = {
							mainValuesFile = "values.yaml",
							additionalValuesFilesGlobPattern = "*/values.yaml",
							-- lintOverlayValuesFile = "values.lint.yaml",
							-- additionalValuesFilesGlobPattern = "values*.yaml",
						},
						yamlls = {
							enabled = true,
							diagnosticsLimit = 0, -- disable all diagnostics
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
				-- filetypes = { "yaml", "yml" },
				-- flags = { debounce_test_changes = 150 },
				settings = {
					yaml = {
						format = {
							enable = true,
							singleQuote = true,
							printWidth = 120,
						},
						hover = true,
						completion = true,
						validate = true,
						schemas = {
							kubernetes = "globPattern",
							["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-workflow.json"] = "/.*/workflows/*",
							-- ["https://json.schemastore.org/github-workflow.json"] = "/.*/workflows/*",
							-- ["https://goreleaser.com/static/schema.json"] = ".goreleaser.yaml",
						},
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/json",
						},
					},
				},
			})
			lspconfig.jsonls.setup({})
			lspconfig.bashls.setup({})
		end,
	},
}
