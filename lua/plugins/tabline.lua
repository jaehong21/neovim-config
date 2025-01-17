return {
	{
		"romgrk/barbar.nvim",
		version = "*",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
			vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", { noremap = true, silent = true })
		end,
		opts = { animation = false },
	},
	{
		"echasnovski/mini.tabline",
		enabled = false,
		version = false,
		config = function()
			require("mini.tabline").setup({
				show_icons = true,
				-- set_vim_settings = true,
				-- tabpage_section = "left",
			})
		end,
	},
	{
		"kdheepak/tabline.nvim",
		enabled = false,
		dependencies = {
			"nvim-lualine/lualine.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("tabline").setup({
				enable = true,
			})
		end,
	},
}
