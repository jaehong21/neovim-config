return {
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
}
