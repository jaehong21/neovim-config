return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- NOTE: OPTIONAL:
			--  `nvim-notify` is only needed, if you want to use the notification view.
			--  If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
		opts = {
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},

			cmdline = {
				format = {
					cmdline = { pattern = "^:", icon = ">_", lang = "vim" },
				},
			},
		},
	},
	--[[ {
		"rcarriga/nvim-notify",
		enabled = false,
		opts = {
			on_open = function(win)
				local config = vim.api.nvim_win_get_config(win)
				config.border = "single"
				vim.api.nvim_win_set_config(win, config)
			end,
		},
		config = function(_, opts)
			-- :h notify.setup()
			---@diagnostic disable-next-line: undefined-field
			require("notify").setup({
				render = "compact",
				stages = "fade_in_slide_out",
				timeout = 150,
				top_down = true,
				on_open = opts.on_open,
			})
		end,
	}, ]]
}
