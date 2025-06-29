return {
	"folke/snacks.nvim",
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		indent = {
			enabled = true,
			animate = {
				enabled = false, -- default: vim.fn.has("nvim-0.10") == 1,
			},
		},
	},
}
