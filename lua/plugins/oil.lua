return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		watch_for_changes = true,
		keymaps = {
			-- ["g?"] = { "actions.show_help", mode = "n" },
			-- ["<CR>"] = "actions.select",
			-- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
			-- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
			-- ["<C-t>"] = { "actions.select", opts = { tab = true } },
			-- ["<C-p>"] = "actions.preview",
			-- ["<C-c>"] = { "actions.close", mode = "n" },
			["<C-r>"] = "actions.refresh", -- Originally "<C-l>"
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
			show_hidden = false,
			is_hidden_file = function(name, bufnr)
				local hidden_patterns = {
					"^%.", -- files and directories starting with `.`
					"^target/?$",
					"^node_modules/?$",
				}
				for _, pattern in ipairs(hidden_patterns) do
					if name:match(pattern) then
						return true
					end
				end
				return false
			end,
		},
	},
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function(_, opts)
		vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
		require("oil").setup(opts)
	end,
}
