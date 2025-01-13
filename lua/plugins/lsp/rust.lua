return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"rust",
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				rust = { "rustfmt" },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			setup = {
				["rust_analyzer"] = function()
					return true
				end,
			},
		},
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		ft = { "rust" },
		lazy = false,
	},

	{
		"saecki/crates.nvim",
		tag = "stable",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},
}
