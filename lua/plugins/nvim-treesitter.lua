return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		opts = {
			ensure_installed = {}, -- collected from lsp/ files via lazy.nvim opts merge
		},
		config = function(_, opts)
			local parsers = opts.ensure_installed or {}

			require("nvim-treesitter").setup()

			-- Install missing parsers (replaces ensure_installed option)
			if #parsers > 0 then
				local installed = require("nvim-treesitter").get_installed()
				local to_install = vim.iter(parsers):filter(function(p) return not vim.tbl_contains(installed, p) end):totable()
				if #to_install > 0 then require("nvim-treesitter").install(to_install) end
			end

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter.setup", {}),
				callback = function(args)
					local buf = args.buf
					local filetype = args.match

					-- you need some mechanism to avoid running on buffers that do not
					-- correspond to a language (like oil.nvim buffers), this implementation
					-- checks if a parser exists for the current language
					local language = vim.treesitter.language.get_lang(filetype) or filetype
					if not vim.treesitter.language.add(language) then return end

					-- replicate `fold = { enable = true }`
					vim.wo.foldmethod = "expr"
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

					-- replicate `highlight = { enable = true }`
					vim.treesitter.start(buf, language)

					-- replicate `indent = { enable = true }`
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

					-- incremental selection via built-in an/in textobjects (Neovim 0.12)
					vim.keymap.set("n", ",", "van", { buffer = buf, remap = true, desc = "Init treesitter selection" })
					vim.keymap.set("x", ",", "an", { buffer = buf, remap = true, desc = "Increment treesitter selection" })
					vim.keymap.set("x", "<BS>", "in", { buffer = buf, remap = true, desc = "Decrement treesitter selection" })
				end,
			})
		end,
	},
	-- https://github.com/jaehong21/neovim-config/blob/6ad838a06cbbc30fb927d8571f7e83d3fcbd4a7b/lua/plugins/nvim-treesitter.lua#L33
	--[[ {
	  "nvim-treesitter/nvim-treesitter-textobjects",
	  lazy = true,
	}, ]]
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
		},
	},
}
