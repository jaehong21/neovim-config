return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
					--
					"python",
					"go",
					"gomod",
					"gosum",
					"c",
					"cpp",
					"rust",
					--
					"terraform",
					"dockerfile",
					--
					"lua",
					"markdown",
					"yaml",
					"toml",
					"bash",
					"vim",
					"vimdoc",
				},
				auto_install = true,
				sync_install = false,
				autopairs = { enable = true },
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						-- init_selection = "<C-Space>",
						init_selection = ",",
						node_incremental = ",",
						node_decremental = "<bs>", -- backspace
						scope_incremental = false,
					},
				},
			})
		end,
	},
}
