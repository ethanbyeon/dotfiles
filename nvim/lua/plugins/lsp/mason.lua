return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"cssls",
				"gopls",
				"html",
				"lua_ls",
				"pyright",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"black",
				"eslint_d",
        "flake8",
        "gofumpt",
        "isort",
				"prettier",
				"stylua",
			},
		})
	end,
}
