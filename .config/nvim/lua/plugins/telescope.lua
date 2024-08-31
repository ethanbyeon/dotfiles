local function setup_telescope()
	local actions = require("telescope.actions")
	require("telescope").setup({
		defaults = {
			layout_strategy = "vertical",
			layout_config = {
				preview_cutoff = 0,
			},
			mappings = {
				n = {
					["<C-c>"] = actions.close,
					["<C-h>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["<S-h>"] = actions.move_to_top,
					["<S-m>"] = actions.move_to_middle,
					["<S-l>"] = actions.move_to_bottom,
				},
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-c>"] = actions.close,
				},
			},
		},
		pickers = {
			buffers = {
				theme = "dropdown",
			},
			diagnostics = {
				theme = "dropdown",
			},
			find_files = {
				theme = "dropdown",
			},
			help_tags = {
				theme = "dropdown",
			},
			highlights = {
				theme = "dropdown",
			},
			live_grep = {
				theme = "dropdown",
			},
			lsp_references = {
				theme = "dropdown",
			},
			oldfiles = {
				theme = "dropdown",
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = setup_telescope,
}
