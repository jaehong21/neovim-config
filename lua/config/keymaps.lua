local mapKey = require("utils.keymapper").mapKey

-- pane navigation
-- mapKey("<C-h>", "<C-w>h") -- Left
-- mapKey("<C-j>", "<C-w>j") -- Down
-- mapKey("<C-k>", "<C-w>k") -- Up
-- mapKey("<C-l>", "<C-w>l") -- Right

-- pane navigation (Colemak-DH)
mapKey("<C-m>", "<C-w>h") -- Left
mapKey("<C-n>", "<C-w>j") -- Down
mapKey("<C-e>", "<C-w>k") -- Up
mapKey("<C-i>", "<C-w>l") -- Right

-- split
mapKey("<leader>vs", "<Cmd>vsplit<CR>", "n")

-- buffer
-- mapKey("<S-h>", "<Cmd>bprev<CR>", "n") -- Previous buffer
-- mapKey("<S-l>", "<Cmd>bnext<CR>", "n") -- Next buffer
mapKey("<leader>q", "<Cmd>bd<CR>", "n") -- Close pane
mapKey("<leader><leader>", "<C-^>")     -- Move to last buffer

-- buffer navigation (Colemak-DH)
mapKey("<S-m>", "<Cmd>bprev<CR>", "n") -- Previous buffer
mapKey("<S-i>", "<Cmd>bnext<CR>", "n") -- Next buffer

-- clear search highlight
mapKey("<leader>h", ":nohlsearch<CR>")

-- indent
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")

-- vertical resize
mapKey("+", ":vertical resize +5<CR>")
mapKey("_", ":vertical resize -5<CR>")

-- Open github repo in browser
mapKey("<leader>gh", "<Cmd>!gh repo view --web<CR>", "n")

-- Colemak-DH hjkl remap
mapKey("n", "j", "n")
mapKey("e", "k", "n")
-- mapKey("m", "h", "n")
-- mapKey("i", "l", "n") -- Not setting this to avoid contlict for `Insert` mode

mapKey("<C-n>", "n", "n") -- Mapping Ctrl+n to next search result

mapKey("n", "j", "v")
mapKey("e", "k", "v")
-- mapKey("m", "h", "v")
-- mapKey("i", "l", "v") -- Not setting this to avoid contlict for `Visual` mode
