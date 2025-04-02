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

	--[[ {
		"mistweaverco/kulala.nvim",
		opts = {
			default_view = "body",
		},
		config = function(_, opts)
			require("kulala").setup(opts)

			-- https://www.lazyvim.org/extras/util/rest
			-- https://kulala.mwco.app/docs/usage/public-methods
			vim.keymap.set(
				"n",
				"<leader>kr",
				"<cmd>lua require('kulala').run()<cr>",
				{ noremap = true, silent = true, desc = "Run request" }
			)
			vim.keymap.set(
				"n",
				"<leader>kt",
				"<cmd>lua require('kulala').toggle_view()<cr>",
				{ noremap = true, silent = true, desc = "Toggle between body and headers" }
			)

			vim.filetype.add({ extension = { ["http"] = "http" } })
		end,
	} ]]
}
