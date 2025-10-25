-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/html.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/cssls.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/vtsls.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ts_ls.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/tailwindcss.lua
vim.lsp.enable({
	"html",
	"cssls",
	"vtsls",
	-- "ts_ls",
	"tailwindcss",
})

-- https://zed.dev/docs/languages/typescript#inlay-hints
local inlay_hints_settings = {
	parameterNames = {
		enabled = "all",
		suppressWhenArgumentMatchesName = false,
	},
	parameterTypes = {
		enabled = false,
	},
	variableTypes = {
		enabled = false,
		suppressWhenTypeMatchesName = true,
	},
	propertyDeclarationTypes = {
		enabled = true,
	},
	functionLikeReturnTypes = {
		enabled = false,
	},
	enumMemberValues = {
		enabled = false,
	},
}

vim.lsp.config("vtsls", {
	-- root_dir = require("lspconfig.util").root_pattern(".git"),
	root_dir = function(bufnr, on_dir)
		local project_root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
		local project_root = vim.fs.root(bufnr, project_root_markers)
		if not project_root then return end
		on_dir(project_root)
	end,
	settings = {
		javascript = {
			inlayHints = inlay_hints_settings,
		},
		typescript = {
			inlayHints = inlay_hints_settings,
		},
	},
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters = {
				prettierd = {
					prepend_args = {
						-- "--single-quote",
						-- "--no-semi",
					},
				},
				htmlbeautifier = {
					prepend_args = { "--keep-blank-lines", "1" },
				},
			},
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "deno_fmt" },
				typescriptreact = { "deno_fmt" },
				html = { "htmlbeautifier" },
				css = { "deno_fmt" },
			},
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},
}
