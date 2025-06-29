-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/sqls.lua
--[[ vim.lsp.enable("sqls")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "sql" })
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				sql = { "sql_formatter" },
			},
		},
	},
} ]]
