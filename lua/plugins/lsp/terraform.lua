return {
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
			vim.list_extend(opts.ensure_installed, {
				"terraform",
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				terraform = { "terraform_fmt" },
				terragrunt = { "terragrunt_hclfmt" },
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
