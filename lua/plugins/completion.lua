return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets", -- optional: provides snippets for the snippet source
		},
		version = "*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- https://cmp.saghen.dev/configuration/keymap.html#presets
			---@diagnostic disable-next-line: assign-type-mismatch
			keymap = {
				preset = "enter", -- "default" | "super-tab" | "enter"
			},
			cmdline = {
				keymap = {
					preset = "super-tab",
				},
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
				ghost_text = { enabled = false },
			},
			sources = {
				default = {
					"lsp",
					"buffer",
					"snippets",
					"path",
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
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
