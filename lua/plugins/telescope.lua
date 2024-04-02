local mapKey = require("utils.keymapper").mapKey

return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local builtin =  require("telescope.builtin")
        mapKey('<leader>ff', builtin.find_files)
        -- mapKey('<leader>ff', ':Telescope find_files hidden=true<CR>')
        mapKey('<leader>fg', builtin.live_grep)
        mapKey('<leader>fb', builtin.buffers)
        mapKey('<leader>fh', builtin.help_tags)

        -- require('telescope').setup({
        --   defaults = {
        --     vimgrep_arguments = {
        --       'rg',
        --       '--color=never',
        --       '--no-heading',
        --       '--with-filename',
        --       '--line-number',
        --       '--column',
        --       '--smart-case',
        --       '--hidden',
        --     },
        --   },
        -- })
      end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({

        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
