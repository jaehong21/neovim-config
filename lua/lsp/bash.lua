-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/bashls.lua
vim.lsp.enable("bashls")
vim.lsp.config("bashls", {
	settings = {
		bashIde = {
			shellcheckArguments = "--exclude=SC2034", -- Ignore unused variables
		},
	},
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "bash" })
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				sh = { "shfmt" },
			},
		},
	},

	--[[ {
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				sh = { "shellcheck" },
			},
			linters = {
				shellcheck = {
					-- args = {
					-- 	"-e",
					-- 	"SC2034", -- Ignore unused variables
					-- },
					env = {
						-- https://github.com/koalaman/shellcheck/wiki/Ignore#ignoring-errors
						["SHELLCHECK_OPTS"] = "-e SC2034", -- Ignore unused variables
					},
				},
			},
		},
	}, ]]
}
