return {
	"folke/trouble.nvim",
	version = "v2.*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.keymap.set("n", "gt", "<Cmd>TroubleToggle<CR>")
	end,
}
