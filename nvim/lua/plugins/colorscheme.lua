local function setup_colorscheme()
	require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = false,
		show_end_of_buffer = false,
		term_colors = false,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false,
		no_bold = false,
		no_underline = false,
		styles = {
			comments = {},
			conditionals = {},
		},
		color_overrides = {
			mocha = {
				base = "#000000",
				mantle = "#000000",
				crust = "#000000",
			},
		},
		custom_highlights = function(colors)
			return {
				CursorLineNr = { fg = "#B3A180" },
				FloatBorder = { fg = "#1E6251" },
				TermCursor = { bg = "#50E4AA" },
			}
		end,
		integrations = {
			cmp = true,
			gitsigns = true,
			mason = true,
			nvimtree = true,
			telescope = true,
			treesitter = true,
		},
	})
	vim.cmd.colorscheme("catppuccin")
end

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = setup_colorscheme,
}
