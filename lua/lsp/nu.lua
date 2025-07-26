-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/nushell.lua
vim.lsp.enable("nushell")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "nu" })
		end,
	},
}
