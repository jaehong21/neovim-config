vim.g.mapleader = " " -- global leader
vim.g.maplocalleader = " " -- local leader

-- autoreload when file changes
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- open neo-tree automatically
-- https://github.com/AstroNvim/AstroNvim/issues/344#issuecomment-1214143220

-- vim.api.nvim_create_augroup("neotree", {})
-- vim.api.nvim_create_autocmd("UiEnter", {
--   desc = "Open Neotree automatically",
--   group = "neotree",
--   callback = function()
--     if vim.fn.argc() == 0 then
--       vim.cmd "Neotree toggle"
--     end
--   end,
-- })
