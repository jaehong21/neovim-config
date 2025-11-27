return {
	"folke/snacks.nvim",
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		---@class snacks.snacks.explorer.Config
		explorer = {
			enabled = true,
			replace_netrw = true, -- Replace netrw with the snacks explorer
		},
		picker = {
			sources = {
				---@class snacks.picker.Config
				explorer = {
					focus = "list", -- "input" | "list"
					layout = {
						preset = "sidebar",
						auto_hide = { "input" },
						layout = { width = 35 },
					},
				},
			},
		},
	},
	keys = {
		{ "<leader>e", function() Snacks.explorer.open() end, desc = "Open [E]xplorer" },
		-- { "<leader>fr", function() Snacks.explorer.open() end, desc = "[F]ile [R]eveal in Explorer" },
		-- { "<leader>fr", function() Snacks.explorer.reveal() end, desc = "[F]ile [R]eveal in Explorer" },
	},
}
