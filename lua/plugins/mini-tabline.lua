return {
	{
		"echasnovski/mini.tabline",
		version = false,
		config = function()
			require("mini.tabline").setup({
				show_icons = true,
				set_vim_settings = true,
				tabpage_section = "left",
			})
		end,
	},
}
