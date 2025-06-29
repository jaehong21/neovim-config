return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		---@module "tokyonight"
		---@class tokyonight.Config
		opts = {
			style = "moon", -- moon, storm, day, night
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
		config = function() vim.cmd("colorscheme tokyonight") end,
	},
	--[[ {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "macchiato", -- auto, latte, frappe, macchiato, mocha
			background = {
				light = "macchiato",
				dark = "macchiato",
			},
			transparent_background = true,
			-- https://github.com/catppuccin/nvim#integrations
			integrations = {
				snacks = {
					enabled = true,
				},
			},
		},
		config = function() vim.cmd("colorscheme catppuccin") end,
	}, ]]
	--[[ {
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {},
		config = function() vim.cmd("colorscheme gruvbox") end,
	}, ]]
	--[[ {
	    "rebelot/kanagawa.nvim",
	    lazy = false,
	    priority = 1000,
	    config = function()
	        ---@diagnostic disable-next-line: missing-fields
	        require("kanagawa").setup({ background = { dark = "wave" } })
	        vim.cmd("colorscheme kanagawa")
	    end,
	    opts = {},
	}, ]]
}
