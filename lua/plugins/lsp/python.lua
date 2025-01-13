return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"ninja",
				"python",
				"rst",
				"toml",
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				python = { "isort", "ruff_format" },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			servers = {
				pylsp = {
					settings = {
						pylsp = {
							plugins = {
								pycodestyle = {
									enabled = true,
									ignore = { "E501" }, -- Ignore line length warnings
								},
								pyflakes = {
									enabled = true,
									ignore = { "unknown-attribute" },
								},
							},
						},
					},
				},
				pyright = {},
			},
		},
	},

	{
		"linux-cultist/venv-selector.nvim",
		branch = "regexp",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		lazy = false,
		opts = {
			auto_refresh = true,
			enable_cached_venvs = true,
			cached_venv_automatic_activation = true,
			notify_user_on_venv_activation = true,
		},
		event = "VeryLazy",
		keys = {},
		config = function()
			require("venv-selector").setup({
				keys = {},
			})
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		keys = {
			{
				"<leader>dPt",
				function()
					require("dap-python").test_method()
				end,
				desc = "Debug Method",
				ft = "python",
			},
			{
				"<leader>dPc",
				function()
					require("dap-python").test_class()
				end,
				desc = "Debug Class",
				ft = "python",
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.auto_brackets = opts.auto_brackets or {}
			table.insert(opts.auto_brackets, "python")
		end,
	},

	-- {
	-- 	"nvim-neotest/neotest",
	-- 	optional = true,
	-- 	dependencies = {
	-- 		"nvim-neotest/neotest-python",
	-- 	},
	-- 	opts = {
	-- 		adapters = {
	-- 			["neotest-python"] = {
	-- 				-- Here you can specify the settings for the adapter, i.e.
	-- 				-- runner = "pytest",
	-- 				-- python = ".venv/bin/python",
	-- 			},
	-- 		},
	-- 	},
	-- },
	--
	-- {
	-- 	"nvim-neotest/neotest-python",
	-- 	lazy = true,
	-- },
}
