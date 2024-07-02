return {
	-- {
	-- 	"echasnovski/mini.tabline",
	-- 	version = false,
	-- 	config = function()
	-- 		require("mini.tabline").setup({
	-- 			show_icons = true,
	-- 			set_vim_settings = true,
	-- 			tabpage_section = "left",
	-- 		})
	-- 	end,
	-- },
	{
		"kdheepak/tabline.nvim",
		dependencies = {
			"hoob3rt/lualine.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("tabline").setup({
				enable = true,
			})
		end,
	},
}
