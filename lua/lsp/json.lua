-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/jsonls.lua
vim.lsp.enable("jsonls")

vim.lsp.config("jsonls", {
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://www.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig.json", "tsconfig.*.json" },
					url = "https://www.schemastore.org/tsconfig.json",
				},
				{
					fileMatch = { "deno.json" },
					url = "https://raw.githubusercontent.com/denoland/deno/main/cli/schemas/config-file.v1.json",
				},
				{
					fileMatch = { ".claude/settings.json", ".claude/settings.local.json" },
					url = "https://www.schemastore.org/claude-code-settings.json",
				},
			},
			validate = { enable = true },
		},
	},
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "json" })
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				json = { "deno_fmt" },
			},
		},
	},

	--[[ {
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				json = { "jsonlint" },
			},
		},
	}, ]]
}
