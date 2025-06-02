return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
	-- stylua: ignore
	keys = {
		-- { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		-- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		-- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    
    -- Disable default keymaps
		{ "s", mode = { "n", "x", "o" }, false },
		{ "S", mode = { "n", "x", "o" }, false },
		{ "r", mode = "o", false },
		{ "R", mode = { "o", "x" }, false },
		{ "<c-s>", mode = { "c" }, false },
	},
	config = function(_, opts)
		local wk = require("which-key")

		wk.add({
			{
				"<leader>s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
		})
	end,
}
