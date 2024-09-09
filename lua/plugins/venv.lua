return {
	"linux-cultist/venv-selector.nvim",
	branch = "regexp",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	lazy = false,
	opts = {
		auto_refresh = true,
		enable_cached_venvs = true,
		cached_venv_automatic_activation = true,
		notify_user_on_venv_activation = true,
	},
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		-- { "<leader>vs", "<cmd>VenvSelect<cr>" },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		-- { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
	config = function()
		require("venv-selector").setup({
			keys = {},
			-- pyenv_path = "/Users/jetty/.pyenv/versions",
			-- poetry_path = "/Users/jetty/Library/Caches/pypoetry/virtualenvs",
		})
	end,
}
