return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"html",
				"htmlbeautifier",
				"htmx",
				"cssls",
				"prettier",
				"prettierd",
				"eslint_d",
				"ts_ls",
				"svelte",
				"tailwindcss",
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
				cssls = {
					settings = {
						css = {
							validate = true,
							lint = { unknownAtRules = "ignore" },
						},
						scss = {
							validate = true,
							lint = { unknownAtRules = "ignore" },
						},
						less = {
							validate = true,
							lint = { unknownAtRules = "ignore" },
						},
					},
				},
				-- htmx = {},
				eslint = {},
				ts_ls = {},
				-- svelte = {},
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
