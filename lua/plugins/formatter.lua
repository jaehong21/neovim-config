return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePre", "BufNewFile" },
		opts = {},
		config = function()
			local lint = require("lint")

			-- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
				json = { "jsonlint" },
			}

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

			-- https://www.reddit.com/r/neovim/comments/19ceuoq/comment/kuna12d
			lint.linters.markdownlint.args = {
				"--disable",
				"MD012",
				"MD013",
				"MD033",
				"--", -- Required
			}
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufNewFile" },
		opts = {
			-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				markdown = { "markdownlint" },
			},
			format_after_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 500,
			},
		},
		-- opts_extend = { "formatters_by_ft" },

		--[[ config = function()
      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        local conform = require("conform")
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end, ]]
	},
}
