return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"cpp",

				"python",
				"toml",

				"go",
				"gomod",
				"gosum",

				"rust",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"typescript",
				"html",
				"nix",

				"terraform",
				"yaml",
			},
			auto_install = true,
			sync_install = false,
			autopairs = { enable = true },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
