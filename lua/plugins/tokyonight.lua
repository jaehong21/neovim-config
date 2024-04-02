return {
  {
    -- "ellisonleao/gruvbox.nvim",
    -- priority = 1000,
    -- lazy = false,
    -- config = function()
    --   vim.cmd("colorscheme gruvbox")
    -- end,
    -- opts = {}
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = {
           sidebars = "transparent",
           floats = "transparent",
        }
      })

      vim.cmd("colorscheme tokyonight")
    end,
    opts = {},
  },
}

