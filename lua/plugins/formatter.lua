return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"prettierd",
					"eslint_d",
					"htmlbeautifier",
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
					"hclfmt",
					"tflint",
					--
					"stylua",
					"markdownlint",
					"yamllint",
					"jsonlint",
					"beautysh",
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
				--
				-- python = { "pylint" },
				go = { "golangcilint" },
				--
				terraform = { "tflint" },
				--
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
		config = function()
			local conform = require("conform")

			-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
			conform.setup({
				formatters_by_ft = {
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescriptreact = { "prettierd" },
					html = { "htmlbeautifier" },
					css = { "prettierd" },
					--
					python = { "isort", "black" },
					go = { "gofumpt", "goimports" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					rust = { "rustfmt" },
					--
					hcl = { "hclfmt" },
					terraform = { "terraform_fmt", "hclfmt" },
					--
					lua = { "stylua" },
					markdown = { "markdownlint" },
					yaml = { "prettier" },
					zsh = { "beautysh" },
				},
				format_after_save = {
					lsp_fallback = true,
					async = true,
					timeout_ms = 500,
				},
			})

			conform.formatters.prettierd = {
				prepend_args = {
					-- "--single-quote",
					"--no-semi",
				},
			}

			conform.formatters.htmlbeautifier = {
				prepend_args = function()
					-- https://github.com/Glavin001/atom-beautify/issues/285#issuecomment-289088405
					return { "--keep-blank-lines", "1" }
				end,
			}

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
