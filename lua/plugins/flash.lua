return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@module "flash"
	---@type Flash.Config
	---@diagnostic disable-next-line: missing-fields
	opts = {},
	keys = {
		{ "F", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "[F]lash" },
	},
}
