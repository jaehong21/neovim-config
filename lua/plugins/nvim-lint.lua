return {
	"mfussenegger/nvim-lint",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		linters_by_ft = {
			dockerfile = { "hadolint" },
		},
		-- linters = {},
	},
	config = function(_, opts)
		local lint = require("lint")
		-- Merge `opts.linters_by_ft`
		lint.linters_by_ft = vim.tbl_deep_extend("force", lint.linters_by_ft, opts.linters_by_ft or {})

		-- Merge custom linter configurations
		if opts.linters then
			for linter, config in pairs(opts.linters) do
				-- e.g. cmd, args, ...
				for key, value in pairs(config) do
					lint.linters[linter][key] = value
				end
			end
		end

		-- Set inline diagnostics
		vim.diagnostic.config({ virtual_text = true })

		vim.api.nvim_create_autocmd({
			"BufEnter",
			"BufWritePost",
			"InsertLeave",
		}, {
			callback = function() lint.try_lint() end,
		})
	end,
}
