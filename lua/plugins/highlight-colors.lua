return {
	"brenoprata10/nvim-highlight-colors",
	-- https://github.com/brenoprata10/nvim-highlight-colors?tab=readme-ov-file#options
	opts = {
		-- https://github.com/brenoprata10/nvim-highlight-colors?tab=readme-ov-file#render-modes
		render = "virtual", -- "background" | "foreground" | "virtual"
		enable_tailwind = true,
	},
	-- Ensure termguicolors is enabled if not already
	-- vim.opt.termguicolors = true
}
