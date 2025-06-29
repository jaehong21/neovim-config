-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/html.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/cssls.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/vtsls.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/tailwindcss.lua
vim.lsp.enable({
	"html",
	"cssls",
	"vtsls",
	"tailwindcss",
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters = {
				prettierd = {
					prepend_args = {
						-- "--single-quote",
						-- "--no-semi",
					},
				},
				htmlbeautifier = {
					prepend_args = { "--keep-blank-lines", "1" },
				},
			},
			formatters_by_ft = {
				javascript = { "deno_fmt" },
				typescript = { "deno_fmt" },
				javascriptreact = { "deno_fmt" },
				typescriptreact = { "deno_fmt" },
				html = { "htmlbeautifier" },
				css = { "deno_fmt" },
			},
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},
}
