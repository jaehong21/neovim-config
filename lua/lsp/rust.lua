-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/rust_analyzer.lua
-- NOTE: `rust-analyzer` is enabled through `rustaceanvim` plugin
-- vim.lsp.enable("rust_analyzer")

-- https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file#gear-advanced-configuration
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {},
	},
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "rust" })
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				rust = { "rustfmt" },
			},
		},
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false, -- this plugin is already lazy
		--[[ config = function()
			local bufnr = vim.api.nvim_get_current_buf()
			vim.keymap.set(
				"n",
				"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
				function() vim.cmd.RustLsp({ "hover", "actions" }) end,
				{ silent = true, buffer = bufnr }
			)
			vim.keymap.set("n", "<leader>ca", function()
				vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
				-- or vim.lsp.buf.codeAction() if you don't want grouping.
			end, { silent = true, buffer = bufnr })
		end, ]]
	},

	{
		"saecki/crates.nvim",
		tag = "stable",
		event = { "BufRead Cargo.toml" },
		opts = {},
	},
}
