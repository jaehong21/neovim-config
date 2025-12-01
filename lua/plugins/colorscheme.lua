return {
	--[[ {
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
	}, ]]
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "macchiato", -- auto, latte, frappe, macchiato, mocha
			transparent_background = true,
			auto_integrations = true,
			-- https://github.com/catppuccin/nvim/issues/946#issuecomment-3448300002
			custom_highlights = function(colors)
				return {
					SnacksPickerBorder = { fg = colors.surface0 },
					SnacksPickerInputTitle = { fg = colors.surface0 },
				}
			end,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd("colorscheme catppuccin")

			-- https://github.com/folke/snacks.nvim/discussions/455#discussioncomment-11835458
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
		end,
	},
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
