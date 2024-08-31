local function setup_lsp()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup_handlers({
        function(server_name)
            lspconfig[server_name].setup({
                capabilities = capabilities,
            })
        end,
        ["clangd"] = function()
            lspconfig["clangd"].setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                    "--offset-encoding=utf-16",
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
            })
        end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            local opts = { buffer = ev.buf, silent = true }
            -- LSP
            vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
            vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)
            vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
            vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
            vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts)
            vim.keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
            vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
            -- Diagnostic
            vim.keymap.set("n", "<leader>d", ":Telescope diagnostics bufnr=0<CR>", opts)
            vim.keymap.set("n", "<leader>df", ":lua vim.diagnostic.open_float()<CR>", opts)
            vim.keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
            vim.keymap.set("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
            -- Format
            vim.keymap.set("n", ":F", ":lua vim.lsp.buf.format()<CR>", opts)
        end,
    })

    -- Diagnostic Signs
    local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
    for type, sign in pairs(signs) do
        local name = "DiagnosticSign" .. type
        vim.fn.sign_define(name, { text = sign, texthl = name, numhl = "" })
    end

    -- Diagnostic
    vim.cmd("highlight floatBorder guifg=#0E3733")
    vim.diagnostic.config({
        virtual_text = false,
        signs = { active = signs },
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
    })

    -- Handlers
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
    },
    config = setup_lsp,
}
