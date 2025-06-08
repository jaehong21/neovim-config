return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"hclfmt",
				"tflint",
				"tfsec",
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- TODO: expect official terragrunt support
			vim.treesitter.language.register("hcl", "terragrunt")
			vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
				pattern = "terragrunt.hcl",
				command = "set filetype=terragrunt",
			})

			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "terraform" })
		end,
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				-- hcl = { "hclfmt" },
				terraform = { "terraform_fmt" },
				terragrunt = { "terragrunt_hclfmt" },
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				terraform = { "tflint", "tfsec" },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			servers = {
				terraformls = {},
			},
		},
	},
}
