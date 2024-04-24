return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"eslint",
					--
					"pylint",
					"black",
					"isort",
					"golangci-lint",
					"gofumpt",
					"goimports",
					"clang-format",
					"rustfmt",
					--
					"tflint",
					"tfsec",
					--
					"luacheck",
					"nixpkgs-fmt",
					"stylua",
					"markdownlint",
					"yamllint",
					"jsonlint",
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
			lint.linters_by_ft = {
				javascript = { "eslint" },
				typescript = { "eslint" },
				javascriptreact = { "eslint" },
				typescriptreact = { "eslint" },
				--
				python = { "pylint" },
				go = { "golangcilint" },
				--
				terraform = { "tflint", "tfsec" },
				--
				-- lua = { "luacheck" },
				markdown = { "markdownlint" },
				-- yaml = { "yamllint" },
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
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					-- svelte = { "prettier" },
					python = { "isort", "black" },
					go = { "gofumpt", "goimports" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					rust = { "rustfmt" },
					--
					terraform = { "terraform_fmt" },
					--
					lua = { "stylua" },
					nix = { "nixpkgs_fmt" },
					markdown = { "prettier" },
					yaml = { "prettier" },
					json = { "prettier" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = true,
					timeout_ms = 500,
				},
			})

			-- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			--   conform.format({
			--     lsp_fallback = true,
			--     async = false,
			--     timeout_ms = 500,
			--   })
			-- end, { desc = "Format file or range (in visual mode)" })
		end,
	},
}
