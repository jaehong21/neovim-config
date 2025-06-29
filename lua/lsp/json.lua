-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/jsonls.lua
vim.lsp.enable("jsonls")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "json" })
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				json = { "deno_fmt" },
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				json = { "jsonlint" },
			},
		},
	},
}
