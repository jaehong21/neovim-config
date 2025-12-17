-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/pyright.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ty.lua
-- vim.lsp.enable("pyright")
vim.lsp.enable("ty")

-- vim.lsp.config("pyright", {
-- 	settings = {
-- 		python = {
-- 			analysis = {
-- 				typeCheckingMode = "off",
-- 			},
-- 		},
-- 	},
-- })

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"ninja",
				"python",
				"rst",
				"toml",
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				python = {
					"ruff_organize_imports",
					-- "ruff_fix",
					"ruff_format",
				},
			},
		},
	},

	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			-- "nvim-telescope/telescope.nvim",
			-- "mfussenegger/nvim-dap-python",
		},
		event = "VeryLazy",
		opts = {
			auto_refresh = true,
			notify_user_on_activate = true,
		},
		keys = {},
	},
}
