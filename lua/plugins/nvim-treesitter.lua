return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
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
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
							["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
							["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
							["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

							["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
							["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

							["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
							["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

							["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
							["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

							["am"] = {
								query = "@function.outer",
								desc = "Select outer part of a method/function definition",
							},
							["im"] = {
								query = "@function.inner",
								desc = "Select inner part of a method/function definition",
							},

							["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
							["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

							["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>na"] = {
								query = "@parameter.inner",
								desc = "swap parameters/arguments with next",
							},
							["<leader>nm"] = { query = "@function.outer", desc = "swap methods/functions with next" },
						},
						swap_previous = {
							["<leader>pa"] = "@parameter.inner", -- swap parameters/arguments with previous
							["<leader>pm"] = "@function.outer", -- swap methods/functions with previous
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {},
					},
				},
			})
		end,
	},
}
