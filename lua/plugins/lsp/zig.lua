return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "zig" })
		end,
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				zig = { "zig_fmt" },
			},
		},
		-- config = function()
		-- 	vim.g.zig_fmt_autosave = 0 -- disable fmt on_save
		-- end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				zls = {},
			},
		},
	},
}
