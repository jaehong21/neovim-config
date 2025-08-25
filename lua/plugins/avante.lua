return {
	"yetone/avante.nvim",
	enabled = false,
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	build = "make",
	---@module 'avante'
	---@type avante.Config
	---@diagnostic disable-next-line: missing-fields
	opts = {
		provider = "openai",
		providers = {
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4.1",
				api_key_name = "OPENAI_API_KEY",
			},
		},

		file_selector = {
			provider = "native", -- 'native' | 'fzf' (fzf-lua) | 'telescope' | string
			provider_opts = {},
		},

		mappings = {
			submit = {
				insert = "<CR>",
				normal = "<S-CR>",
			},
			ask = "<leader>aa", -- default
			edit = "<leader>ae", -- default
			files = {
				add_current = "<leader>ac", -- Add current buffer to selected files
			},
		},
		hints = {
			enabled = false,
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		-- "echasnovski/mini.pick", -- for file_selector provider mini.pick
		-- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		-- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		-- "ibhagwan/fzf-lua", -- for file_selector provider fzf
		"stevearc/dressing.nvim", -- for input provider dressing
		-- "folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		--[[ {
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		}, ]]
		--[[ {
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		}, ]]
	},
}
