return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "markdownlint" })
		end,
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				markdown = { "markdownlint" },
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				markdown = { "markdownlint" },
			},
			linters = {
				-- https://www.reddit.com/r/neovim/comments/19ceuoq/comment/kuna12d
				markdownlint = {
					args = {
						"--disable",
						"MD012",
						"MD013",
						"MD033",
						"--", -- Required
					},
				},
			},
		},
	},
}
