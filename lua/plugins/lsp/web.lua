return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"html",
				"htmlbeautifier",
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
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				html = { "htmlbeautifier" },
				css = { "prettierd" },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
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
