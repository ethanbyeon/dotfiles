local opt = vim.opt

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI Settings
opt.termguicolors = true
vim.g.have_nerd_font = true
opt.laststatus = 2
opt.updatetime = 750
opt.cmdheight = 0
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.list = true
opt.showbreak = " "
opt.fillchars:append({ eob = " " })
opt.listchars:append({
	eol = "↴",
	trail = "·",
	tab = "  ",
})

-- Cursor
opt.guicursor = ""
opt.cul = true

-- Line Number
opt.relativenumber = true
opt.scrolloff = 10
opt.number = true

-- Indentation
opt.autoindent = true
opt.breakindent = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- Window Splits
opt.splitbelow = true
opt.splitright = true

-- Wrapping & Line Breaks
opt.wrap = true
opt.linebreak = true
opt.textwidth = 80

-- Search Behavior
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.inccommand = "split"

-- Diagnostic Settings
vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
	signs = {
		active = {
			[vim.diagnostic.severity.HINT] = "H",
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.INFO] = "I",
			[vim.diagnostic.severity.WARN] = "W",
		},
	},
})
