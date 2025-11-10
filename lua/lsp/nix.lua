-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/nil_ls.lua
vim.lsp.enable("nil_ls")

vim.lsp.config("nil_ls", {
	settings = {
		-- https://github.com/oxalica/nil/blob/main/docs/configuration.md
		["nil"] = {
			nix = {
				flake = {
					autoArchive = true,
					autoEvalInputs = true,
				},
			},
		},
	},
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "nix" })
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				-- nix = { "nixpkgs_fmt" },
				nix = { "nixfmt" },
			},
		},
	},
}
