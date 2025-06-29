-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/bashls.lua
vim.lsp.enable("bashls")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "bash" })
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				sh = { "shfmt" },
			},
		},
	},
}
