return {
	-- {
	-- 	"stevearc/oil.nvim",
	-- 	opts = {},
	-- 	-- Optional dependencies
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require("neo-tree").setup({
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
			})

			-- Reveal current file in neotree
			vim.keymap.set("n", "<leader>fr", ":Neotree reveal<CR>")
		end,
		opts = {},
	},
}
