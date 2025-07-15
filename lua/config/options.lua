local opt = vim.opt

-- tab/indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- split
opt.splitright = true
opt.splitbelow = true

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- visual
opt.number = true
opt.relativenumber = false
opt.termguicolors = true
opt.signcolumn = "yes"

-- copy & paste
opt.clipboard = "unnamed"

-- code folding
-- https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
opt.foldenable = true
opt.foldcolumn = "1"
opt.foldlevel = 99 -- open all folds by default
opt.foldlevelstart = 99
opt.foldtext = ""

-- etc
opt.encoding = "UTF-8"
opt.cmdheight = 1
opt.scrolloff = 10
opt.mouse:append("a")
