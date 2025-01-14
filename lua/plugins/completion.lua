return {
  {
    "saghen/blink.cmp",
    dependencies = {
      -- optional: provides snippets for the snippet source
      "rafamadriz/friendly-snippets",
      { 'L3MON4D3/LuaSnip', version = 'v2.*' }
    },
    version = "*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- https://cmp.saghen.dev/configuration/keymap.html#presets
      keymap = { preset = "super-tab", }, -- "default" | "super-tab" | "enter"

      appearance = {
        nerd_font_variant = "mono", -- "normal" | "mono"

        use_nvim_cmp_as_default = false,
      },

      completion = {
        ghost_text = { enabled = true },
      },

      snippets = { preset = 'luasnip' },
      sources = {
        -- you can extend it elsewhere in your config, without redefining it, due to `opts_extend`
        default = { "lsp", "snippets", "buffer", "path", },
      },
      -- https://cmp.saghen.dev/configuration/reference.html#signature
      signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
  },

  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup({
        presets = { inc_rename = true },
      })
      vim.keymap.set("n", "<leader>rn", ":IncRename ")
      -- vim.keymap.set("n", "<leader>rn", function()
      --   return ":IncRename " .. vim.fn.expand("<cword>")
      -- end, { expr = true })
    end,
  },

  {
    "github/copilot.vim",
    lazy = false,
    cmd = "Copilot",
  },
  --[[ {
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			vim.opt.completeopt = { "menu", "menuone", "noselect" }

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
					-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- ["<C-Space>"] = cmp.mapping.complete(),
					-- ["<C-e>"] = cmp.mapping.abort(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = "orgmode" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "cmdline" },
				}),
			})
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
		end,
	}, ]]
}
