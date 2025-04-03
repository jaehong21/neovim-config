return {
	{
		"github/copilot.vim",
		lazy = false,
		cmd = "Copilot",
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = "*", -- '*' for latest | 'false' for release
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",

			-- optional dependencies below
			-- "ibhagwan/fzf-lua", -- for `file_selector`
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = { file_types = { "markdown", "Avante" } },
				ft = { "markdown", "Avante" },
			},
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				enabled = false,
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
		-- https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
		opts = {
			---@alias avante.nvim.Provider "claude" | "openai" | "azure" | "gemini" | "vertex" | "cohere" | "copilot" | string
			provider = "openrouter",
			openai = {
				-- api_key_name = "OPENAI_API_KEY",
				-- model = "gpt-4o",
			},
			copilot = {
				-- model = "gpt-4o-2024-08-06", -- "gpt-4o" | "claude-3.5-sonnet"
			},
			vendors = {
				["groq"] = {
					__inherited_from = "openai",
					api_key_name = "GROQ_API_KEY",
					endpoint = "https://api.groq.com/openai/v1",
					model = "llama-3.3-70b-versatile", -- https://console.groq.com/settings/limits
				},
				["openrouter"] = {
					__inherited_from = "openai",
					api_key_name = "OPENROUTER_API_KEY",
					endpoint = "https://openrouter.ai/api/v1",
					model = "openai/gpt-4o-2024-11-20", -- "deepseek/deepseek-v3-0324:free" | "anthropic/claude-3.7-sonnet:thinking"
				},
			},
			file_selector = {
				provider = "telescope", -- 'native' | 'fzf' (fzf-lua) | 'telescope' | string
				provider_opts = {},
			},
			mappings = {
				submit = {
					insert = "<CR>",
					normal = "<S-CR>",
				},
				ask = "<leader>aa",
				edit = "<leader>ae",
				files = {
					add_current = "<leader>ac", -- Add current buffer to selected files
				},
			},
			hints = { enabled = true },
		},
	},
}
