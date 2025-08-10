return {
	"lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			delay = 150, -- default: 1000ms
		},
	},
	keys = {
		{ "<leader>hi", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Git: Preview [H]unk [I]nline" },
		{ "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Git: [H]unk [R]eset" },
		-- blame is not closed by `Snacks.bufdelete()`
		-- { "<leader>hb", "<cmd>Gitsigns blame<cr>", desc = "Git: [P]review [B]lame" },
	},
}
