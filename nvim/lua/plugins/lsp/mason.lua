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
				"html",
				"lua_ls",
				"pyright",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"black",
				"eslint_d",
				"prettier",
				"isort",
				"stylua",
				"flake8",
			},
		})
	end,
}
