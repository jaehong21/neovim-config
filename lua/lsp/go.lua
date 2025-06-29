-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/gopls.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/golangci_lint_ls.lua
vim.lsp.enable({
	"gopls",
	"golangci_lint_ls",
})

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			-- https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
			-- https://www.reddit.com/r/neovim/comments/172v2pn/comment/k3yys0v
			["ui.inlayhint.hints"] = {
				compositeLiteralFields = true,
				constantValues = true,
				parameterNames = true,
			},
		},
	},
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
			linters = {
				golangcilint = {
					-- https://www.reddit.com/r/neovim/comments/1jorqmd/comment/mkw62o1
					args = {
						"run",
						"--output.json.path=stdout",
						"--show-stats=false",
						-- "--issues-exit-code", "0",
					},
				},
			},
		},
	},
}
