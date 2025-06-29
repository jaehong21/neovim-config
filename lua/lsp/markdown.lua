return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "markdown" })
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				markdown = { "deno_fmt" },
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
				markdownlint = {
					args = {
						"--disable",
						"MD012",
						"MD013",
						"--",
					},
				},
			},
		},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons", -- if you prefer nvim-web-devicons
			-- "echasnovski/mini.icons", -- if you use standalone mini plugins
			-- "echasnovski/mini.nvim", -- if you use the mini.nvim suite
		},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}
