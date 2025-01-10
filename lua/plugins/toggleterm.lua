return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	config = function()
		require("toggleterm").setup({
			direction = "horizontal",
			size = 19,
		})
		-- vim.keymap.set({ "n", "t" }, "<leader>j", "<CMD>ToggleTerm<CR>", { noremap = true, silent = true })
		-- vim.keymap.set({ "n", "t" }, "J", "<CMD>ToggleTerm<CR>", { noremap = true, silent = true })

		local Terminal = require("toggleterm.terminal").Terminal

		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		vim.keymap.set({ "n", "t" }, "<leader>gl", function()
			lazygit:toggle()
		end, { noremap = true, silent = true, desc = "[G]it with [L]azygit" })
	end,
}
