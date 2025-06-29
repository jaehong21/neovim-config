-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/dockerls.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/docker_compose_language_service.lua
vim.lsp.enable({
	"dockerls",
	"docker_compose_language_service",
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "dockerfile" })
		end,
	},

	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				dockerfile = { "hadolint" },
			},
		},
	},
}
