return {
	--[[ {
		"windwp/nvim-autopairs",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",
		},
		event = "InsertEnter",
		config = function()
			local cmd_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on(
				"confirm_done",
				cmd_autopairs.on_confirm_done({
					map_char = { tex = "" },
				})
			)

			local npairs = require("nvim-autopairs")
			npairs.setup({
				check_ts = true,
			})
			npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
		end,
	}, ]]

	--[[ {
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter" },
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({
				enable = true,
			})
		end,
	}, ]]

	--[[ {
		"RRethy/nvim-treesitter-endwise",
		dependencies = { "nvim-treesitter" },
		event = "InsertEnter",
		config = function()
			require("nvim-treesitter.configs").setup({
				endwise = { enable = true },
			})
		end,
	}, ]]
}
