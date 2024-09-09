return {
	{
		"folke/trouble.nvim",
		version = "v2.*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			position = "bottom",
			height = 30,
			auto_close = true,
		},
		config = function()
			vim.keymap.set("n", "tt", "<Cmd>TroubleToggle<CR>")
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--hidden",
					"--glob",
					"!.git",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		},
	},
}
