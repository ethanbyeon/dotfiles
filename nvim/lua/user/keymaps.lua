vim.g.mapleader = " "

local function map(mode, keys, action, desc, buf)
	desc = desc or ""
	local opts = { noremap = true, silent = true, desc = desc }
	if buf then
		opts.buffer = buf
	end
	vim.keymap.set(mode, keys, action, opts)
end

-- Clipboard
map("v", "<leader>y", [["+y"]], "Copy to System Clipboard")

-- Buffer Navigation
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<leader>q", ":bdelete<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-p>", "<C-w>w")

-- Selected Text Movement
map("v", "<S-k>", ":m '<-2<CR>gv=gv")
map("v", "<S-j>", ":m '>+1<CR>gv=gv")

-- Indentation
map("i", "<S-Tab>", "<C-d>")
map("v", "<S-Tab>", "<gv")
map("v", "<Tab>", ">gv")

-- Oil
map("n", "<leader>o", ":Oil<CR>")

-- Fzf-lua
map("n", "<leader>fb", ":FzfLua buffers<CR>", "List Buffers")
map("n", "<leader>ff", ":FzfLua files<CR>", "Find Files")
map("n", "<leader>fg", ":FzfLua live_grep<CR>", "Grep Files")
map("n", "<leader>fh", ":FzfLua helptags<CR>", "Help Tags")
map("n", "<leader>fr", ":FzfLua oldfiles<CR>", "Recent Files")
map("n", "<leader>fd", ":FzfLua diagnostics_document<CR>", "Buffer Diagnostics")
map("n", "<leader>fd", ":FzfLua diagnostics_workspace<CR>", "Workspace Diagnostics")
map("n", "<leader>fc", ":FzfLua files cwd=" .. vim.fn.stdpath("config") .. "<CR>", "Edit Neovim Config")
map("n", "<leader>gs", ":FzfLua git_status<CR>", "Git Status")
map("n", "<leader>gc", ":FzfLua git_commits<CR>", "Git Commits")
map("n", "<leader>gb", ":FzfLua git_branches<CR>", "Git Branches")

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local buf = ev.buf

		-- General
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename", buf)
		map("n", "K", vim.lsp.buf.hover, "Hover", buf)

		-- Fzf-lua
		map({ "n", "v" }, "<leader>ca", ":FzfLua lsp_code_actions<CR>", "LSP Code Actions", buf)
		map("n", "gr", ":FzfLua lsp_references<CR>", "LSP References", buf)
		map("n", "gD", ":FzfLua lsp_declarations<CR>", "Go to Declaration", buf)
		map("n", "gd", ":FzfLua lsp_definitions<CR>", "Go to Definitions", buf)
		map("n", "gi", ":FzfLua lsp_implementations<CR>", "Go to Implementations", buf)

		-- Diagnostics
		map("n", "<leader>df", vim.diagnostic.open_float, "Open Diagnostic Float", buf)
		map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic", buf)
		map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic", buf)

		-- Formatting
		map("n", "<leader><S-f>", vim.lsp.buf.format, "Format File", buf)
	end,
})
