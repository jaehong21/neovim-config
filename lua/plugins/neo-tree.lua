return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
		},
		enabled = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function(_, opts)
			vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
			require("oil").setup(opts)
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = true,
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		opts = {
			window = {
				position = "left",
				width = 35,
			},
			filesystem = {
				filtered_items = {
					visible = false,
					always_show = {
						".gitignore",
						".golangci.yml",
						".dockerignore",
						".github",
						".gitea",
						".gitlab-ci.yml",
						".circleci",
						".pre-commit-config.yaml",
						".goreleaser.yaml",
						"generated",
						".npmrc",
						".nvmrc",
						".yarnrc.yml",
						"data",
						".streamlit",
						".pulumi",
						".air.toml",
						".dev.vars",
						".env",
						".env.local",
						".env.development",
						".env.production",
					},
				},
			},
		},
		config = function(_, opts)
			require("neo-tree").setup(opts)
			-- Reveal current file in neotree
			vim.keymap.set("n", "<leader>fr", ":Neotree reveal<CR>")
		end,
	},
}
