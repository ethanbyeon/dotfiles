return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
			indent = { tab_char = "▏" },
			exclude = { filetypes = { "dashboard" } },
			scope = {
				char = "▏",
				enabled = true,
				include = {
					node_type = {
						["*"] = { "*" },
					},
				},
				show_start = false,
				show_end = false,
			},
		})
	end,
}
