return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"vim",
				"vimdoc",
				"query",
				"just",
				"regex",
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			servers = {
				docker_compose_language_service = {},
				dockerls = {},
				autotools_ls = {},
				bashls = {},
				jsonls = {},
			},
		},
	},
}
