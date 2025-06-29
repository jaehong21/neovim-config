return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			auto_install = false,
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
		},
		config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
	},
	-- https://github.com/jaehong21/neovim-config/blob/6ad838a06cbbc30fb927d8571f7e83d3fcbd4a7b/lua/plugins/nvim-treesitter.lua#L33
	--[[ {
	  "nvim-treesitter/nvim-treesitter-textobjects",
	  lazy = true,
	}, ]]
	{
		"nvim-treesitter/nvim-treesitter-context",
		-- cmd = "TSContext", -- `enable`, `disable`, `toggle`
		opts = {
			enable = true,
		},
	},
}
