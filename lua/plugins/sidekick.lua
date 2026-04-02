return {
	"folke/sidekick.nvim",
	---@class sidekick.Config
	opts = {
		nes = {
			enabled = true,
		},
		cli = {
			---@class sidekick.win.Opts
			win = {
				layout = "float", ---@type "float"|"left"|"bottom"|"top"|"right"
				--- Options used when layout is "float"
				---@type vim.api.keyset.win_config
				float = {
					width = 0.9,
					height = 0.9,
				},
				-- Options used when layout is "left"|"bottom"|"top"|"right"
				---@type vim.api.keyset.win_config
				split = {
					width = 80, -- set to 0 for default split width
					height = 20, -- set to 0 for default split height
				},
			},
			---@class sidekick.cli.Mux
			mux = {
				backend = "tmux", ---@type "zellij" | "tmux"
				enabled = true,
			},
			---@type table<string, sidekick.cli.Config|{}>
			tools = {
				claude = {
					cmd = { "claude", "--dangerously-skip-permissions" },
				},
			},
		},
	},
	keys = {
		-- set at blink-cmp.lua for "<Tab>"
		{
			"<tab>",
			function()
				-- if there is a next edit, jump to it, otherwise apply it if any
				if not require("sidekick").nes_jump_or_apply() then
					return "<Tab>" -- fallback to normal tab
				end
			end,
			expr = true,
			desc = "Goto/Apply Next Edit Suggestion",
		},
		{
			"<c-.>",
			function() require("sidekick.cli").toggle() end,
			desc = "Sidekick Toggle",
			mode = { "n", "t", "i", "x" },
		},
		--[[ {
			"<leader>aa",
			function() require("sidekick.cli").toggle() end,
			desc = "Sidekick Toggle CLI",
		}, ]]
		{
			"<leader>aa",
			function() require("sidekick.cli").select() end,
			-- Or to select only installed tools:
			-- require("sidekick.cli").select({ filter = { installed = true } })
			desc = "Select CLI",
		},
		{
			"<leader>ad",
			function() require("sidekick.cli").close() end,
			desc = "Detach a CLI Session",
		},
		--[[ {
			"<leader>at",
			function() require("sidekick.cli").send({ msg = "{this}" }) end,
			mode = { "x", "n" },
			desc = "Send This",
		}, ]]
		{
			"<leader>af",
			function() require("sidekick.cli").send({ msg = "{file}" }) end,
			desc = "Send File",
		},
		{
			"<leader>av",
			function() require("sidekick.cli").send({ msg = "{selection}" }) end,
			mode = { "x" },
			desc = "Send Visual Selection",
		},
		{
			"<leader>ap",
			function() require("sidekick.cli").prompt() end,
			mode = { "n", "x" },
			desc = "Sidekick Select Prompt",
		},
		-- Example of a keybinding to open Claude directly
		{
			"<leader>ac",
			function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
			desc = "Sidekick Toggle Claude",
		},
	},
}
