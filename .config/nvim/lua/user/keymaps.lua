--[[ Key Mappings for Language Support

| FEATURE    | MODE | KEYMAP       | COMMAND                                   |
|------------|------|--------------|-------------------------------------------|
| LSP        | N    | "K"          | ":lua vim.lsp.buf.hover()<CR>"            |
| LSP        | N    | "gr"         | ":Telescope lsp_references<CR>"           |
| LSP        | N    | "g<S-d>"     | ":lua vim.lsp.buf.declaration()<CR>"      |
| LSP        | N    | "gd"         | ":Telescope lsp_definitions<CR>"          |
| LSP        | N    | "gi"         | ":Telescope lsp_implementations<CR>"      |
| LSP        | N    | "gt"         | ":Telescope lsp_type_definitions<CR>"     |
| LSP        | N, V | "<leader>ca" | ":lua vim.lsp.buf.code_action()<CR>"      |
| LSP        | N    | "<leader>rn" | ":lua vim.lsp.buf.rename()<CR>"           |
| Diagnostic | N    | "<leader>d"  | ":Telescope diagnostics bufnr=0<CR>"      |
| Diagnostic | N    | "<leader>df" | ":lua vim.diagnostic.open_float()<CR>"    |
| Diagnostic | N    | "[d"         | ":lua vim.diagnostic.goto_prev()<CR>"     |
| Diagnostic | N    | "]d"         | ":lua vim.diagnostic.goto_next()<CR>"     |
| Format     | N    | ":F"         | ":lua vim.lsp.buf.format()<CR>"           |

--]]

vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Buffer Navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<leader>q", ":bdelete<CR>", opts)

-- Window Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-p>", "<C-w>w", opts)

-- Text Movement
map("v", "<S-k>", ":m '<-2<CR>gv=gv")
map("v", "<S-j>", ":m '>+1<CR>gv=gv")

-- Indents
map("i", "<S-Tab>", "<C-d>", opts)
map("v", "<S-Tab>", "<gv", opts)
map("v", "<Tab>", ">gv", opts)

-- Nvim-Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
map("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
