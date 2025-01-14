return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		event = "VeryLazy",
		opts = {},
		init = function()
			-- Note: prioritize treesitter(100) over lsp
			vim.highlight.priorities.semantic_tokens = 99
		end,
		config = function(_, opts)
			---@diagnostic disable-next-line: unused-local
			local on_attach = function(client, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				-- nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>rn", ":IncRename ", "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				-- nmap("<leader>ca", "<cmd>CodeActionMenu<cr>", "[C]ode [A]ction")

				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				-- nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				nmap("gu", "<Cmd>Telescope lsp_references<CR>", "[G]oto [R]eferences")
				nmap("gi", "<Cmd>Telescope lsp_implementations<CR>", "[G]oto [I]mplementation")
				nmap("gt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
				-- nmap("<leader>fs", "<Cmd>Telescope lsp_document_symbols<CR>", "[F]ind Document [S]ymbols")
				-- nmap("<leader>fS", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "[F]ind Workspace [S]ymbols")

				nmap("K", vim.lsp.buf.hover, "Hover Documentation [Explain]")
				-- nmap("gh", vim.lsp.buf.signature_help, "[S]ignature [D]ocumentation")
				-- nmap("<C-h>", vim.lsp.buf.signature_help, "[S]ignature [H]elp")

				-- nmap("<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>", "[V]iew [D]iagnostic")
				-- nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "[D]iagnostic [P]revioues")
				-- nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", "[D]iagnostic [N]ext")

				-- lsp_format.on_attach(client, bufnr)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local buffer = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client then
						return on_attach(client, buffer)
					end
				end,
			})

			local servers = opts.servers

			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = servers,
			})

			local lspconfig = require("lspconfig")
			for server, server_opts in pairs(servers) do
				-- server_opts.capabilities =
				--   require("cmp_nvim_lsp").default_capabilities(server_opts.capabilities)
				lspconfig[server].setup(server_opts)
			end
		end,
	},
}
