return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup({
        options = {
          -- theme = "gruvbox"
          -- theme = "tokyonight"
          theme = "kanagawa"
        }
      })
    end
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        background = {
          dark = "wave",
        }
      })

      vim.cmd("colorscheme kanagawa")
    end,
    opts = {},
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       transparent = true,
  --       styles = {
  --          sidebars = "transparent",
  --          floats = "transparent",
  --       }
  --     })
  --
  --     vim.cmd("colorscheme tokyonight")
  --   end,
  --   opts = {},
  -- }
}

