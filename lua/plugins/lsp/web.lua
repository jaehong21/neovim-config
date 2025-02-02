return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"prettier",
				"prettierd",
				"eslint_d",
				"htmlbeautifier",
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"html",
				"css",
				"htmx",
				"jsx",
				"tsx",
				"javascript",
				"typescript",
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters = {
				prettierd = {
					prepend_args = {
						-- "--single-quote",
						"--no-semi",
					},
				},
				htmlbeautifier = {
					prepend_args = { "--keep-blank-lines", "1" },
				},
			},
			formatters_by_ft = {
				javascript = { "prettierd", "eslint_d" },
				typescript = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
				html = { "htmlbeautifier" },
				css = { "prettierd" },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			servers = {
				html = {},
				cssls = {},
				htmx = {},
				eslint = {},
				ts_ls = {},
				svelte = {},
				tailwindcss = {},
			},
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},
}
