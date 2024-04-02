local mapKey = require("utils.keymapper").mapKey

-- Neotree toggle
mapKey('<leader>e', ':Neotree toggle<cr>')

-- pane navigation
mapKey('<C-h>', '<C-w>h') -- Left
mapKey('<C-j>', '<C-w>j') -- Down
mapKey('<C-k>', '<C-w>k') -- Up
mapKey('<C-l>', '<C-w>l') -- Right
mapKey('<leader>fq', ':close', 'n') -- Close pane

mapKey('<leader>fr', ':Neotree reveal<CR>', 'n') -- Reveal current file in neotree
mapKey('<leader><leader>', '<C-^>') -- Move to last buffer

-- clear search highlight
mapKey('<leader>h', ':nohlsearch<CR>')

-- indent
mapKey('<', '<gv', 'v')
mapKey('>', '>gv', 'v')

