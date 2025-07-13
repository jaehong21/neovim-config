return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {},
		init = function()
			-- prioritize treesitter(100) over lsp
			vim.highlight.priorities.semantic_tokens = 99
		end,
		config = function()
			vim.lsp.inlay_hint.enable(true)

			-- Keymaps
			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then desc = "LSP: " .. desc end
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				-- nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local buffer = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client then return on_attach(client, buffer) end
				end,
			})
		end,
	},

	{
		"smjonas/inc-rename.nvim",
		opts = {},
		keys = {
			{ "<leader>rn", ":IncRename ", desc = "[R]e[N]ame" },
			-- vim.keymap.set("n", "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { expr = true })
		},
	},
}
