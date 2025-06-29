return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		image = { enabled = true },
		input = { enabled = true },
		lazygit = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = false },
	},
	keys = {
		-- buffer
		{ "<leader>q", function() Snacks.bufdelete() end, desc = "[Q]uit Buffers" },
		{ "<leader>bd", function() Snacks.bufdelete.all() end, desc = "[B]uffers [D]elete All" },
		{ "<leader>bo", function() Snacks.bufdelete.other() end, desc = "[B]uffers Delete [O]ther" },
		-- lazygit
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "To[g]gle Lazy[G]it" },
		{ "<leader>gl", function() Snacks.lazygit() end, desc = "To[g]gle [L]azygit" },
	},
}
