-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/rust_analyzer.lua
vim.lsp.enable("rust_analyzer")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "rust" })
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				rust = { "rustfmt" },
			},
		},
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false, -- this plugin is already lazy
	},

	{
		"saecki/crates.nvim",
		tag = "stable",
		event = { "BufRead Cargo.toml" },
		opts = {},
	},
}
