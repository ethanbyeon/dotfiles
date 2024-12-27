local function set_hl(group, opts)
	opts = opts or {}
	vim.api.nvim_set_hl(0, group, opts)
end

set_hl("FzfBorder", { fg = "#184E41" })
set_hl("FzfCursorLine", { fg = "#1E6251" })
set_hl("FzfText", { fg = "#26A682" })
set_hl("FzfSelected", { fg = "#2FD0A2" })
set_hl("FzfSpinner", { fg = "#50E4AA" })
set_hl("FzfCursor", { fg = "#94F5D4" })
set_hl("FzfTitle", { fg = "#B3A180" })
set_hl("FzfSearchLine", { fg = "#FFFFFF", bg = "#B3A180" })
set_hl("FzfSearchText", { fg = "#000000", bold = true })

local function setup_fzf()
	require("fzf-lua").setup({
		hls = {
			border = "FzfBorder",
			title = "FzfTitle",
			preview_border = "FzfBorder",
			preview_title = "FzfTitle",
			header_text = "FzfText",
			search = "FzfSearchText",
			cursor = "FzfCursor",
			cursorline = "FzfSearchLine",
			scrollborder_f = "FzfSelected",
		},
		fzf_colors = {
			["fg"] = { "fg", "FzfCursorLine" },
			["fg+"] = { "fg", "FzfSearchText" },
			["bg+"] = { "fg", "FzfCursorLine" },
			["hl"] = { "fg", "FzfText" },
			["hl+"] = { "fg", "FzfSpinner" },
			["info"] = { "fg", "FzfTitle" },
			["prompt"] = { "fg", "FzfTitle" },
			["pointer"] = { "fg", "FzfSpinner" },
			["marker"] = { "fg", "FzfTitle" },
			["spinner"] = { "fg", "FzfSpinner" },
			["separator"] = { "fg", "FzfBorder" },
			["scrollbar"] = { "fg", "FzfCursor" },
			["header"] = { "fg", "FzfText" },
			["query"] = { "fg", "FzfText" },
			["cursor"] = { "bg", "FzfCursor" },
			["gutter"] = "-1",
		},
		winopts = {
			border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
			backdrop = 100,
			preview = {
				layout = "horizontal",
				horizontal = "right:50%",
			},
			height = 0.7,
			width = 1.0,
			row = 1.0,
		},
		keymap = {
			builtin = {
				true,
				["<C-d>"] = "preview-page-down",
				["<C-u>"] = "preview-page-up",
				["<C-o>"] = "toggle-preview",
			},
		},
		builtin = {
			prompt = "> ",
			winopts = {
				title = " BUILTIN ",
				title_pos = "center",
				height = 0.8,
				width = 0.6,
				row = 0.5,
				col = 0.55,
				preview = {
					hidden = "hidden",
					layout = "vertical",
				},
			},
		},
		files = {
			formatter = "path.filename_first",
			prompt = "> ",
			cwd_prompt = false,
			winopts = {
				title = " FILES ",
				title_pos = "center",
				height = 0.8,
				width = 0.6,
				row = 0.5,
				col = 0.55,
				preview = {
					hidden = "hidden",
					layout = "vertical",
				},
			},
		},
		buffers = {
			winopts = {
				title = " BUFFERS ",
				title_pos = "center",
				height = 0.8,
				width = 0.6,
				row = 0.35,
				col = 0.55,
				preview = {
					hidden = "hidden",
					layout = "vertical",
				},
			},
		},
		oldfiles = {
			cwd_only = true,
			stat_file = true,
		},
	})
end

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = setup_fzf,
}
