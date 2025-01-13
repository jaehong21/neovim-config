---@diagnostic disable: deprecated

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		opts = {},
		config = function()
			local configs = require("nvim-treesitter.configs")
			---@diagnostic disable-next-line: missing-fields
			configs.setup({
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
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
							["l="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
							-- ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
							-- ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

							["ap"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
							["lp"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

							["ac"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
							["lc"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

							["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
							["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

							["aa"] = { query = "@call.outer", desc = "Select outer part of a function call" },
							["la"] = { query = "@call.inner", desc = "Select inner part of a function call" },

							["af"] = {
								query = "@function.outer",
								desc = "Select outer part of a method/function definition",
							},
							["lf"] = {
								query = "@function.inner",
								desc = "Select inner part of a method/function definition",
							},

							["as"] = { query = "@class.outer", desc = "Select outer part of a class/struct" },
							["ls"] = { query = "@class.inner", desc = "Select inner part of a class/struct" },
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>np"] = {
								query = "@parameter.inner",
								desc = "swap parameters/arguments with next",
							},
							["<leader>nf"] = { query = "@function.outer", desc = "swap methods/functions with next" },
						},
						swap_previous = {
							["<leader>mp"] = "@parameter.inner", -- swap parameters/arguments with previous
							["<leader>mf"] = "@function.outer", -- swap methods/functions with previous
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]a"] = { query = "@call.outer", desc = "Next function call start" },
							["]f"] = { query = "@function.outer", desc = "Next method/function definition start" },
							["]s"] = { query = "@class.outer", desc = "Next class start" },
							["]c"] = { query = "@conditional.outer", desc = "Next conditional start" },
							["]l"] = { query = "@loop.outer", desc = "Next loop start" },

							-- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
							-- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
						},
						goto_next_end = {
							["]A"] = { query = "@call.outer", desc = "Next function call end" },
							["]F"] = { query = "@function.outer", desc = "Next method/function definition end" },
							["]S"] = { query = "@class.outer", desc = "Next class end" },
							["]C"] = { query = "@conditional.outer", desc = "Next conditional end" },
							["]L"] = { query = "@loop.outer", desc = "Next loop end" },
						},
						goto_previous_start = {
							["[a"] = { query = "@call.outer", desc = "Previous function call start" },
							["[f"] = { query = "@function.outer", desc = "Previous method/function definition start" },
							["[s"] = { query = "@class.outer", desc = "Previous class start" },
							["[c"] = { query = "@conditional.outer", desc = "Previous conditional start" },
							["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
						},
						goto_previous_end = {
							["[A"] = { query = "@call.outer", desc = "Previous function call end" },
							["[F"] = { query = "@function.outer", desc = "Previous method/function definition end" },
							["[S"] = { query = "@class.outer", desc = "Previous class end" },
							["[C"] = { query = "@conditional.outer", desc = "Previous conditional end" },
							["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
						},
					},
				},
			})

			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
			vim.keymap.set({ "n", "x", "o" }, "<bs>", ts_repeat_move.repeat_last_move_opposite)

			-- Optional: remain builtin vim commands
			vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
			vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
			vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
			vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
		end,
	},
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			require("aerial").setup({
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
				vim.keymap.set("n", "<leader>t", "<cmd>AerialToggle!<CR>"),
			})
		end,
	},
}
