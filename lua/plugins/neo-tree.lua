return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			keymaps = {
				-- ["g?"] = { "actions.show_help", mode = "n" },
				-- ["<CR>"] = "actions.select",
				-- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
				-- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				-- ["<C-t>"] = { "actions.select", opts = { tab = true } },
				-- ["<C-p>"] = "actions.preview",
				-- ["<C-c>"] = { "actions.close", mode = "n" },
				-- ["<C-l>"] = "actions.refresh",
				-- ["-"] = { "actions.parent", mode = "n" },
				-- ["_"] = { "actions.open_cwd", mode = "n" },
				-- ["`"] = { "actions.cd", mode = "n" },
				-- ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				-- ["gs"] = { "actions.change_sort", mode = "n" },
				-- ["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				-- ["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
			-- Set to false to disable all of the above keymaps
			use_default_keymaps = true,
			view_options = {
				show_hidden = true,
			},
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
