return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"yaml",
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				yaml = { "yamlfmt" },
			},
		},
	},

	{ "towolf/vim-helm", ft = "helm" },

	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = function(_, opts)
			opts.servers = vim.tbl_deep_extend("force", opts.servers, {
				-- yamlls = require("yaml-companion").setup(),
				yamlls = {
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
				},
				helm_ls = {
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
			})
		end,
	},

	{
		"someone-stole-my-name/yaml-companion.nvim",
		lazy = true,
		ft = "yaml",
	},

	-- helm
	-- if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
	--   vim.diagnostic.enable(false, bufnr)
	--   vim.defer_fn(function()
	--     vim.diagnostic.reset(nil, bufnr)
	--   end, 1000)
	-- end

	--       vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	--         pattern = "Chart.yaml",
	--         callback = function()
	--           vim.opt_local.filetype = "helm"
	--         end
	--       })
}
