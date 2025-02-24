local function setup_treesitter()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"c",
			"cpp",
			"css",
      "go",
			"html",
			"javascript",
			"lua",
			"markdown",
			"python",
			"typescript",
			"vimdoc",
		},
		sync_install = false,
		auto_install = false,
		highlight = {
			enable = true,
			disable = { "" },
		},
		indent = {
			enable = true,
			disable = { "python" },
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = setup_treesitter,
}
