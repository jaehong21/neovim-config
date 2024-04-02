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
      vim.cmd("colorscheme tokyonight")
    end,
    opts = {},
  }
}

