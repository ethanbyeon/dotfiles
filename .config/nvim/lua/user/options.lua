local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.have_nerd_font = true

-- UI
opt.updatetime = 750
opt.termguicolors = true
opt.cmdheight = 0
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.laststatus = 3
opt.list = true
opt.fillchars = "eob: "
opt.listchars:append("eol:↴")
opt.showbreak = "↪ "

-- CURSOR
opt.guicursor = ""
opt.cul = true

-- LINES
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.number = true

-- INDENTS
opt.autoindent = true
opt.breakindent = true
opt.smartindent = true

-- WINDOWS
opt.splitbelow = true
opt.splitright = true

-- WRAP
opt.wrap = true
opt.linebreak = true
opt.textwidth = 80

-- TABS
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- SEARCH
opt.hlsearch = true
opt.incsearch = true
-- Case-insensitive searching (unless capital letters in the search term)
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.inccommand = "split" -- Preview substitutions live, as you type
