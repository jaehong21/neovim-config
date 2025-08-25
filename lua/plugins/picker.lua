return {
	"folke/snacks.nvim",
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		---@class snacks.picker.Config
		---@field exclude? string[] exclude glob patterns
		picker = {
			enabled = true,

			hidden = true, -- show hidden files
			ignored = true, -- show ignored files by `.gitignore`
			exclude = {
				".git",
				"node_modules",
				".venv",
				"__pycache__",
				"target",
			},

			layout = {
				preset = "default", -- "default" | "vertical"
			},

			---@class snacks.picker.matcher.Config
			matcher = { -- the bonusses below, possibly require string concatenation and path normalization,
				-- so this can have a performance impact for large lists and increase memory usage
				cwd_bonus = true, -- give bonus for matching files in the cwd
				frecency = true, -- frecency bonus
				history_bonus = true, -- give more weight to chronological order
			},

			ui_select = true, -- replace `vim.ui.select` with the snacks picker

			---@class snacks.picker.formatters.Config
			formatters = {
				file = {
					filename_first = false,
					truncate = 80, -- default: 40
				},
			},
		},
	},
	keys = {
		-- Search
		{
			"<leader>ff",
			function()
				---@class snacks.picker.smart.Config: snacks.picker.Config
				---@field exclude? string[] exclude glob patterns
				Snacks.picker.smart({
					multi = { "files" },
				})
			end,
			desc = "Smart [F]ind [F]iles",
		},
		{ "<leader>fg", function() Snacks.picker.grep() end, desc = "[F]ind by [G]rep" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "[F]ind [B]uffers" },
		{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "[G]it [B]ranches" },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "[F]ile [R]ecent" },
		-- LSP
		{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "[G]oto [D]efinitions" },
		{ "gu", function() Snacks.picker.lsp_references() end, desc = "[G]oto [U]sage" },
		{ "gi", function() Snacks.picker.lsp_implementations() end, desc = "[G]oto [I]mplementations" },
		{ "<leader>ft", function() Snacks.picker.lsp_symbols() end, desc = "[F]ind [T]reesitter symbols" },
		-- Todo Comments
		---@diagnostic disable-next-line: undefined-field
		{ "<leader>xt", function() Snacks.picker.todo_comments() end, desc = "Find [T]odo" },
		-- Misc
		{ "<leader>fh", function() Snacks.picker.help() end, desc = "[F]ind [H]elp Pages" },
		{ "<leader>fc", function() Snacks.picker.commands() end, desc = "[F]ind [C]ommands" },
	},
}
