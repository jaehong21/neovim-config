return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					progress = { enabled = false },
					signature = { enabled = false },
					hover = { enabled = false },
				},
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			on_open = function(win)
				local config = vim.api.nvim_win_get_config(win)
				config.border = "single"
				vim.api.nvim_win_set_config(win, config)
			end,
		},
		config = function()
			-- :h notify.setup()
			---@diagnostic disable-next-line: undefined-field
			require("notify").setup({
				render = "compact",
				stages = "fade_in_slide_out",
				timeout = 150,
				top_down = true,
			})
		end,
	},
}
