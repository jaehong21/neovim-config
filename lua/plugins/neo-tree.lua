return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = false,
	---@module "neo-tree"
	-- ---@type neotree.Config?
	opts = {
		window = {
			position = "left",
			width = 32,
			mappings = {
				-- Disable 'e' key mapping to prevent conflicts with remaps withe Colemak-DH layout.
				-- ["e"] = "noop",
			},
		},
		filesystem = {
			filtered_items = {
				visible = true,
				--[[
        always_show = {
          ".gitignore",
          ".golangci.yml",
          ".dockerignore",
          ".github",
          ".gitea",
          ".gitlab-ci.yml",
          ".pre-commit-config.yaml",
          ".goreleaser.yaml",
          ".npmrc",
          ".nvmrc",
          ".yarnrc.yml",
          ".streamlit",
          ".env",
          }, ]]
			},
		},
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
		{ "<leader>fr", "<cmd>Neotree reveal<cr>", desc = "Reveal in NeoTree" },
	},
}
