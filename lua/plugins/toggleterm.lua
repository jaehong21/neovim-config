return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  config = function()
    require('toggleterm').setup()
    vim.keymap.set({ "n", "t" }, "J", "<CMD>ToggleTerm<CR>", { noremap = true, silent = true })

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

    vim.keymap.set({ "n", "t" }, "<Leader>gl", function() lazygit:toggle() end,
      { noremap = true, silent = true, desc = '[G]it with [L]azygit' })

    local k9s = Terminal:new({ cmd = "k9s", hidden = true, direction = "float" })
    vim.keymap.set({ "n", "t" }, "<Leader>k9", function() k9s:toggle() end,
      { noremap = true, silent = true, desc = '[K][9]s' })

    local gitui = Terminal:new({ cmd = "gitui", hidden = true, direction = "float" })

    vim.keymap.set({ "n", "t" }, "<Leader>gu", function() gitui:toggle() end,
      { noremap = true, silent = true, desc = '[G]it[U]i' })
  end
}
