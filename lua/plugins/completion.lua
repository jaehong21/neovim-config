return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {
			sources = {
				compat = { "avante_commands", "avante_mentions", "avante_files" },
			},
		},
	},

	{
		"saghen/blink.cmp",
		dependencies = {
			"saghen/blink.compat",
			-- optional: provides snippets for the snippet source
			"rafamadriz/friendly-snippets",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},
		version = "*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- https://cmp.saghen.dev/configuration/keymap.html#presets
			keymap = {
				preset = "enter", -- "default" | "super-tab" | "enter"
				cmdline = { preset = "super-tab" },
			},
			appearance = {
				nerd_font_variant = "mono", -- "normal" | "mono"
				use_nvim_cmp_as_default = false,
			},

			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					treesitter_highlighting = true,
				},
				ghost_text = { enabled = true },
			},
			snippets = { preset = "luasnip" },
			sources = {
				-- you can extend it elsewhere in your config, without redefining it, due to `opts_extend`
				default = {
					"lsp",
					"snippets",
					"buffer",
					"path",
					"avante_commands",
					"avante_mentions",
					"avante_files",
				},
				providers = {
					avante_commands = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 90, -- show at a higher priority than lsp
						opts = {},
					},
					avante_files = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 100, -- show at a higher priority than lsp
						opts = {},
					},
					avante_mentions = {
						name = "avante_mentions",
						module = "blink.compat.source",
						score_offset = 1000, -- show at a higher priority than lsp
						opts = {},
					},
				},
			},
			-- https://cmp.saghen.dev/configuration/reference.html#signature
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},

	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({
				presets = { inc_rename = true },
			})
			vim.keymap.set("n", "<leader>rn", ":IncRename ")
			-- vim.keymap.set("n", "<leader>rn", function()
			--   return ":IncRename " .. vim.fn.expand("<cword>")
			-- end, { expr = true })
		end,
	},
}
