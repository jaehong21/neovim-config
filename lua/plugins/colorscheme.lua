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
					-- theme = "gruvbox",
					-- theme = "kanagawa",
					theme = "tokyonight",
					-- theme = "catppuccin",
				},
			})
		end,
	},
	-- {
	-- 	"morhetz/gruvbox",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("kanagawa").setup({ background = { dark = "wave" } })
	-- 		vim.cmd("colorscheme kanagawa")
	-- 	end,
	-- 	opts = {},
	-- },
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

			vim.cmd("colorscheme tokyonight")
		end,
		opts = {},
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "mocha", -- auto, latte, frappe, macchiato, mocha
	-- 			-- background = {
	-- 			-- 	light = "frappe",
	-- 			-- 	dark = "frappe",
	-- 			-- },
	-- 			transparent_background = false,
	-- 			integrations = {
	-- 				harpoon = true,
	-- 				neotree = true,
	-- 				noice = true,
	-- 				cmp = true,
	-- 				notify = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
