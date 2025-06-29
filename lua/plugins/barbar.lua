return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function() vim.g.barbar_auto_setup = false end,
	opts = {
		-- animation = false,

		icons = {
			buffer_index = false,
			buffer_number = true,
			button = "x",
			preset = "default", -- "default", "powerline", "slanted"
		},

		-- new buffers will be inserted at the start/end of the list.
		insert_at_end = true,
	},
}
