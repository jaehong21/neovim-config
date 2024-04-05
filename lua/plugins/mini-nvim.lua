return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.pairs").setup({})
			require("mini.tabline").setup({
				show_icons = true,
				set_vim_settings = true,
				tabpage_section = "left",
			})
		end,
	},
}
