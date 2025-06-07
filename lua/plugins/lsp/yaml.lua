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
			formatters = {
				yamlfmt = {
					-- https://github.com/google/yamlfmt/blob/main/docs/command-usage.md
					-- https://github.com/google/yamlfmt/blob/main/docs/config-file.md
					prepend_args = {
						"-formatter",
						"retain_line_breaks_single=true,drop_merge_tag=true",
					},
				},
			},
			formatters_by_ft = {
				yaml = { "yamlfmt" },
			},
		},
	},

	{ "towolf/vim-helm", ft = "helm" },

	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			yamlls = {
				filetypes = { "yaml", "yml" },
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
							kubernetes = "*.yaml",
							-- ["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-workflow.json"] = "/.*/workflows/*",
							["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
							["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
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
		},
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
