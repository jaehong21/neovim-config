return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.icons",
		"nvim-lua/plenary.nvim",
	},
	enabled = true,
	opts = {},
	config = function(_, opts)
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- https://github.com/Asthestarsfalll/img2arg
		-- https://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20

		-- set header
		dashboard.section.header.val = {
			"",
			"",
			"",
			"     ██╗ █████╗ ███████╗██╗  ██╗ ██████╗ ███╗   ██╗ ██████╗ ██████╗  ██╗",
			"     ██║██╔══██╗██╔════╝██║  ██║██╔═══██╗████╗  ██║██╔════╝ ╚════██╗███║",
			"     ██║███████║█████╗  ███████║██║   ██║██╔██╗ ██║██║  ███╗ █████╔╝╚██║",
			"██   ██║██╔══██║██╔══╝  ██╔══██║██║   ██║██║╚██╗██║██║   ██║██╔═══╝  ██║",
			"╚█████╔╝██║  ██║███████╗██║  ██║╚██████╔╝██║ ╚████║╚██████╔╝███████╗ ██║",
			" ╚════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝ ╚═╝",
			"                                                                        ",
			"           ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗           ",
			"           ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║           ",
			"           ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██            ",
			"           ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║           ",
			"           ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║           ",
			"           ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
			"",
			"",
			"",
		}

		-- set menu items
		dashboard.section.buttons.val = {
			-- dashboard.button("e", "> New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("-", "> File preview", "<Cmd>Oil<CR>"),
			dashboard.button("f", "> Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "> Recent", ":Telescope oldfiles<CR>"),
			-- dashboard.button("s", "> Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button("q", "> Quit NVIM", ":qa!<CR>"),
		}
		alpha.setup(dashboard.opts)
	end,
}
