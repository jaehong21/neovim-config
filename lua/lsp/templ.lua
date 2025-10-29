-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/templ.lua
vim.lsp.enable("templ")

vim.lsp.config("templ", {
	filetypes = { "templ", "gotmpl" },
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
				pattern = { "*.tmpl", "*.templ" },
				command = "set filetype=gotmpl",
			})
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "gotmpl" })
		end,
	},
}
