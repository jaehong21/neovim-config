return {
	{
		"tpope/vim-fugitive",
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			local gitblame = require("gitblame")

			gitblame.setup({
				enabled = true,
				message_template = "<author> • <summary> • <date> • <sha>",
				message_when_not_committed = "Not Committed Yet",
				-- ignored_filetypes = {},
				-- delay = 100, -- delay in ms
				schedule_event = "CursorMoved", -- options: CursorMoved, CursorHold
				clear_event = "CursorMovedI", -- options: CursorMovedI, CursorHoldI
				use_blame_commit_file_urls = true,
			})

			vim.keymap.set({ "n", "t" }, "<leader>gu", "<cmd>Git blame<CR>")

			-- require("lualine").setup({
			-- 	sections = {
			-- 		lualine_c = {
			-- 			{ gitblame.get_current_blame_text, cond = gitblame.is_blame_text_available },
			-- 		},
			-- 	},
			-- })
		end,
	},
}
