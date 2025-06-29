-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/gopls.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/golangci_lint_ls.lua
vim.lsp.enable({
	"gopls",
	"golangci_lint_ls",
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
				"go",
				"gomod",
				"gowork",
				"gosum",
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				go = {
					"gofumpt",
					-- "goimports",
				},
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				go = { "golangcilint" },
			},
		},
	},
}
