return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			filetypes = { yaml = true },
		},
		config = true,
	},

	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = "*", -- '*' for latest | 'false' for release
		build = "make",
		-- https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
		opts = {
			---@alias avante.nvim.Provider "claude" | "openai" | "azure" | "gemini" | "vertex" | "cohere" | "copilot" | string
			provider = "copilot",
			openai = {
				-- api_key_name = "OPENROUTER_API_KEY",
				-- endpoint = "https://openrouter.ai/api/v1",
				-- model = "anthropic/claude-3.5-sonnet", -- "deepseek/deepseek-chat" | "openai/chatgpt-4o-latest"
				api_key_name = "OPENAI_API_KEY",
				endpoint = "https://api.openai.com/v1", -- default
				model = "gpt-4o", -- default
			},
			copilot = {
				-- endpoint = "https://api.githubcopilot.com", -- default
				-- model = "gpt-4o-2024-08-06" -- default
			},
			file_selector = {
				provider = "fzf", -- 'native' | 'fzf' (fzf-lua) | 'telescope' | string
				provider_opts = {},
			},
			mappings = {
				submit = {
					insert = "<CR>",
					normal = "<S-CR>",
				},
			},
			hints = { enabled = true },
		},
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",

			-- optional dependencies below
			"ibhagwan/fzf-lua", -- for `file_selector`
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			-- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = { file_types = { "markdown", "Avante" } },
				ft = { "markdown", "Avante" },
			},
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = { insert_mode = true },
						-- use_absolute_path = true, -- for Windows users
					},
				},
			},
		},
	},
}
