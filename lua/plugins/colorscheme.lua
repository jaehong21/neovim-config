return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			---@diagnostic disable-next-line: undefined-field
			require("lualine").setup({
				options = {
					theme = "auto",
				},
			})
		end,
	},
	{
		"morhetz/gruvbox",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd("colorscheme gruvbox")
		end,
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("kanagawa").setup({ background = { dark = "wave" } })
			-- vim.cmd("colorscheme kanagawa")
		end,
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			-- vim.cmd("colorscheme tokyonight")
		end,
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- auto, latte, frappe, macchiato, mocha
				background = {
					light = "macchiato",
					dark = "macchiato",
				},
				transparent_background = true,
				-- https://github.com/catppuccin/nvim#integrations
				integrations = {
					aerial = true,
					alpha = true,
					barbar = true,
					blink_cmp = true,
					cmp = true, -- nvim-cmp
					harpoon = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = true,
					},
					mason = false,
					neotree = true,
					noice = true,
					notify = true,
					which_key = true,
				},
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
