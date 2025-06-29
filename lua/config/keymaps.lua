local mapKey = function(from, to, mode, opts)
	local options = { noremap = true, silent = true }
	mode = mode or "n" -- normal mode
	if opts then options = vim.tbl_extend("force", options, opts) end
	vim.keymap.set(mode, from, to, options)
end

-- pane navigation
mapKey("<C-h>", "<C-w>h") -- Left
mapKey("<C-j>", "<C-w>j") -- Down
mapKey("<C-k>", "<C-w>k") -- Up
mapKey("<C-l>", "<C-w>l") -- Right

-- split
mapKey("<leader>vs", "<cmd>vsplit<cr>")

-- buffer
-- mapKey("<leader>q", "<cmd>bd<cr>") -- Delete current buffer
mapKey("<S-h>", "<cmd>bprev<cr>") -- Previous buffer
mapKey("<S-l>", "<cmd>bnext<cr>") -- Next buffer
mapKey("<leader><leader>", "<C-^>") -- Move to last buffer

-- clear search highlight
mapKey("<leader>h", ":nohlsearch<cr>")

-- indent
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")

-- vertical resize
mapKey("+", ":vertical resize +5<cr>")
mapKey("_", ":vertical resize -5<cr>")

-- Open github repo in browser
-- mapKey("<leader>gh", "<cmd>!gh repo view --web<cr>", "n")
