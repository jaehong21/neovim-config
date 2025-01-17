return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufNewFile" },
		opts = {
			-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_after_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 500,
			},
		},
		-- config = function(_, opts)
		-- 	vim.keymap.set({ "n", "v" }, "<leader>fm", function()
		-- 		require("conform").format(opts.format_after_save)
		-- 	end, { desc = "Format file or range (in visual mode)" })
		-- end,
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePre", "BufNewFile" },
		opts = {
			linters_by_ft = { json = { "jsonlint" } },
		},
		config = function()
			local lint = require("lint")
			-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({
				"BufEnter",
				"BufWritePost",
				"InsertLeave",
			}, {
				callback = function()
					lint.try_lint()
				end,
			})
			-- vim.keymap.set("n", "<leader>l", function()
			-- 	lint.try_lint()
			-- end, { desc = "Trigger linting for current file" })
		end,
	},
}
