return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup({
      window = {
        position = 'left',
        width = 35,
      },
      filesystem = {
        filtered_items = {
          visible = false,
          always_show = {
            ".gitignore",
            ".github",
            ".circleci",
            ".pre-commit-config.yaml",
          }
        }
      },
    })
  end,
  opts = {},
}
