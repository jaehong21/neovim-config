return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- https://github.com/stevearc/aerial.nvim?tab=readme-ov-file#options
		require("aerial").setup({
			-- backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" }, -- default
			layout = {
				min_width = { 30, 0.1 }, -- bigger than 30 columns or 10% of total
			},
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr })
			end,
			vim.keymap.set("n", "<leader>t", "<cmd>AerialToggle!<cr>"),
		})
	end,
}
