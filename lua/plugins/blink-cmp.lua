return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets", -- optional: provides snippets source
		},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
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

			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},

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

			-- https://cmp.saghen.dev/configuration/reference.html#signature
			signature = {
				enabled = true,
			},

			sources = {
				default = {
					"lazydev",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					-- https://github.com/folke/lazydev.nvim?tab=readme-ov-file#-installation
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},

			snippets = {
				preset = "default",
			},
		},
		opts_extend = { "sources.default" },
	},
}
