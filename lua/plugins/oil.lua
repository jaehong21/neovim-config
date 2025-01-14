return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
		require("oil").setup({
			default_file_explorer = true,
		})
	end,
}
