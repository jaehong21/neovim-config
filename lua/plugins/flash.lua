return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		search = {
			incremental = false,
		},
		label = {
			uppercase = false,
			rainbow = {
				enabled = true,
			},
		},
		modes = {
			char = {
				enabled = false,
			},
		},
	},
	keys = {
		{ "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	},
}
