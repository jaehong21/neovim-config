-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/yamlls.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/helm_ls.lua
vim.lsp.enable({
	"yamlls",
	"helm_ls",
})

vim.lsp.config("yamlls", {
	filetypes = { "yaml", "yml" },
	settings = {
		-- https://github.com/redhat-developer/yaml-language-server?tab=readme-ov-file#language-server-settings
		yaml = {
			-- using `yamlfmt` as a formatter
			-- format = {
			-- 	enable = true,
			-- 	singleQuote = false,
			-- 	printWidth = 120,
			-- },
			hover = true,
			completion = true,
			validate = true,
			schemas = {
				kubernetes = {
					"**/deployment.yaml",
					-- "**/service.yaml",
				},
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.{yml,yaml}",
			},
		},
	},
})

vim.lsp.config("helm_ls", {
	settings = {
		["helm-ls"] = {
			yamlls = {
				enabled = false,
				validate = false,
			},
		},
	},
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"yaml",
				"helm",
			})
		end,
	},

	{
		-- for Helm file syntax highlighting
		"towolf/vim-helm",
		ft = "helm",
	},

	--[[ {
		"qvalentin/helm-ls.nvim",
		ft = "helm",
		opts = {
			conceal_templates = {
				enabled = false,
			},
		},
	}, ]]

	{
		"stevearc/conform.nvim",
		--- @module "conform"
		--- @type conform.setupOpts
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

	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				yaml = { "yamllint" },
			},
		},
	},
}
