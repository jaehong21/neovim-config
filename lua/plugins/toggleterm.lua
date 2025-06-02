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

		local wk = require("which-key")

		local Terminal = require("toggleterm.terminal").Terminal

		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		wk.add({
			{
				"<leader>gl",
				function()
					lazygit:toggle()
				end,
				desc = "[G]it with [L]azygit",
			},
		})
		-- vim.keymap.set({ "n", "t" }, "<leader>gl", function()
		-- 	lazygit:toggle()
		-- end, { noremap = true, silent = true, desc = "[G]it with [L]azygit" })

		local hibiscus = Terminal:new({ cmd = "hibiscus", hidden = true, direction = "float" })
		wk.add({
			{
				"<leader>hb",
				function()
					hibiscus:toggle()
				end,
				desc = "[H]i[B]iscus",
			},
		})
		-- vim.keymap.set({ "n", "t" }, "<leader>hb", function()
		-- 	hibiscus:toggle()
		-- end, { noremap = true, silent = true, desc = "[H]i[B]iscus" })
	end,
}
