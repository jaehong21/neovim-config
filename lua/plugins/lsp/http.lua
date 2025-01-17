return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"http",
				"graphql",
			})
		end,
	},

	{
		"mistweaverco/kulala.nvim",
		opts = {
			display_mode = "float", -- "split" | "float"
			default_view = "headers_body", -- "headers_body" | "body" | "headers"
		},
		config = function(_, opts)
			require("kulala").setup(opts)

			-- https://www.lazyvim.org/extras/util/rest
			-- https://kulala.mwco.app/docs/usage/public-methods
			vim.keymap.set(
				"n",
				"<leader>kr",
				"<Cmd>lua require('kulala').run()<CR>",
				{ silent = true, desc = "Run request" }
			)

			vim.filetype.add({ extension = { ["http"] = "http" } })
		end,
	},
}
