return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- set *.mdc to markdown
			vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
				pattern = "*.mdc",
				command = "set filetype=markdown",
			})

			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "markdown" })
		end,
	},

	--[[ {
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				markdown = { "prettierd" },
			},
		},
	}, ]]

	--[[ {
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				markdown = { "markdownlint" },
			},
			linters = {
				markdownlint = {
					args = {
						"--disable",
						"MD012",
						"MD013",
						"--",
					},
				},
			},
		},
	}, ]]

	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons", -- if you prefer nvim-web-devicons
			-- "echasnovski/mini.icons", -- if you use standalone mini plugins
			-- "echasnovski/mini.nvim", -- if you use the mini.nvim suite
		},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		-- https://github.com/iamcco/markdown-preview.nvim/issues/690#issuecomment-2254280534
		init = function()
			if vim.fn.executable("bunx") then vim.g.mkdp_filetypes = { "markdown" } end
		end,
		build = function(plugin)
			if vim.fn.executable("bunx") then
				vim.cmd("!cd " .. plugin.dir .. " && cd app && bunx --yes yarn install")
			else
				vim.cmd([[Lazy load markdown-preview.nvim]])
				vim.fn["mkdp#util#install"]()
			end
		end,
	},
}
