local mapKey = require("utils.keymapper").mapKey

return {
	{
		-- latest is 0.1.8 for now
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					-- vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', },
					mappings = {
						i = { -- insert mode
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
				pickers = {
					find_files = {
						-- theme = "dropdown",
						hidden = true,
						find_command = { "rg", "--files", "--smart-case", "-g", "!.git" },
					},
					-- live_grep = { theme = "dropdown" },
					-- buffers = { theme = "dropdown" },
					-- help_tags = { theme = "dropdown" },
					colorscheme = { enable_preview = true },
				},
				extensions = {
					["ui-select"] = {
						-- 'get_dropdown' | 'get_dropdown' | 'get_ivy'
						-- require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("noice")

			local builtin = require("telescope.builtin")
			mapKey("<leader>ff", builtin.find_files)
			mapKey("<leader>fg", builtin.live_grep)
			mapKey("<leader>fb", builtin.buffers)
			mapKey("<leader>ft", "<Cmd>TodoTelescope<CR>")
			-- mapKey("<leader>fh", builtin.help_tags) -- used in harpoon.lua
			-- mapKey("fu", builtin.lsp_references)
		end,
	},
}
