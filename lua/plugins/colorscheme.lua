return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox",
					-- -- theme = "kanagawa",
					-- theme = "tokyonight",
				},
			})
		end,
	},
	{
		"morhetz/gruvbox",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
		opts = {},
	},
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
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			transparent = true,
	-- 			styles = {
	-- 				sidebars = "transparent",
	-- 				floats = "transparent",
	-- 			},
	-- 		})
	--
	-- 		vim.cmd("colorscheme tokyonight")
	-- 	end,
	-- 	opts = {},
	-- },
}
