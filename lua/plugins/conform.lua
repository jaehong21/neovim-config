return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
		format_after_save = {
			lsp_format = "never",
			async = true,
			timeout_ms = 500,
		},
	},
	-- config = function(_, opts)
	-- 	vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	-- 		require("conform").format(opts.format_after_save)
	-- 	end, { desc = "Format file or range (in visual mode)" })
	-- end,
}
