return {
	"aznhe21/actions-preview.nvim",
	opts = {
		backend = { "snacks" }, -- "telescope", "minipick", "snacks", "nui"

		--- options for snacks picker
		---@type snacks.picker.Config
		---@diagnostic disable-next-line: missing-fields
		snacks = {
			layout = {
				-- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#select
				preset = "select",
			},
		},
	},
	keys = {
		{
			-- Instead of `vim.lsp.buf.code_action`
			"<leader>ca",
			function() require("actions-preview").code_actions() end,
			desc = "[C]ode [A]ction",
		},
	},
}
