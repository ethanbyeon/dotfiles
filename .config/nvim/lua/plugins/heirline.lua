local function setup_heirline()
	local heirline = require("heirline")
	local conditions = require("heirline.conditions")
	local utils = require("heirline.utils")

	local create_symbol = function(symbol, bg_color, fg_color)
		return {
			provider = symbol,
			hl = { bg = bg_color, fg = fg_color },
		}
	end

	local Space = setmetatable({ provider = " " }, {
		__call = function(_, n)
			return { provider = string.rep(" ", n) }
		end,
	})

    -----------------
	-- STATUS LINE --
    -----------------

	local ViMode = {
		init = function(self)
			self.mode = vim.api.nvim_get_mode().mode
			if not self.once then
				vim.api.nvim_create_autocmd("ModeChanged", {
					pattern = "*:*o",
					command = "redrawstatus",
				})
				self.once = true
			end
		end,
		static = {
			MODE_NAMES = {
				["!"] = "SHELL",
				["R"] = "REPLACE",
				["Rc"] = "REPLACE",
				["Rv"] = "V-REPLACE",
				["Rvc"] = "V-REPLACE",
				["Rvx"] = "V-REPLACE",
				["Rx"] = "REPLACE",
				["S"] = "S-LINE",
				["V"] = "V-LINE",
				["Vs"] = "V-LINE",
				["\19"] = "S-BLOCK",
				["\22"] = "V-BLOCK",
				["\22s"] = "V-BLOCK",
				["c"] = "COMMAND",
				["ce"] = "EX",
				["cv"] = "EX",
				["i"] = "INSERT",
				["ic"] = "INSERT",
				["ix"] = "INSERT",
				["n"] = "NORMAL",
				["niI"] = "NORMAL",
				["niR"] = "NORMAL",
				["niV"] = "NORMAL",
				["no"] = "O-PENDING",
				["noV"] = "O-PENDING",
				["no\22"] = "O-PENDING",
				["nov"] = "O-PENDING",
				["nt"] = "NORMAL",
				["ntT"] = "NORMAL",
				["r"] = "REPLACE",
				["r?"] = "CONFIRM",
				["rm"] = "MORE",
				["s"] = "SELECT",
				["t"] = "TERMINAL",
				["v"] = "VISUAL",
				["vs"] = "VISUAL",
			},
		},
		update = { "ModeChanged" },
		provider = function(self)
			local mode = self.mode:sub(1, 1)
			return string.format(" %s 󱗼 ", self.MODE_NAMES[mode])
		end,
		hl = { bg = "#000000", fg = "#85E0D9" },
	}

	local Git = {
		init = function(self)
			self.status_dict = vim.b.gitsigns_status_dict
		end,
		condition = conditions.is_git_repo,
		{ -- Git Branch Name
			provider = function(self)
				if self.status_dict.head == "" then
					return " Unknown  "
				end
				return " " .. self.status_dict.head .. "  "
			end,
			hl = { bold = false },
		},
		hl = { bg = "#000000", fg = "#24655D" },
	}

	local Diagnostics = {
		static = {
			error_icon = "E",
			warn_icon = "W",
			hint_icon = "H",
		},
		init = function(self)
			self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
			self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
			self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		end,
		update = { "DiagnosticChanged", "BufEnter" },
		{ -- Error
			provider = function(self)
				return " " .. self.errors .. self.error_icon .. " "
			end,
			hl = function(self)
				return self.errors > 0 and { fg = "#A1E8E2" }
			end,
		},
		{ -- Warn
			provider = function(self)
				return self.warnings .. self.warn_icon .. " "
			end,
			hl = function(self)
				return self.warnings > 0 and { fg = "#A1E8E2" }
			end,
		},
		-- { -- Hint
		-- 	provider = function(self)
		-- 		return self.hints .. self.hint_icon .. " "
		-- 	end,
		-- 	hl = function(self)
		-- 		return self.hints > 0 and { fg = "#A1E8E2" }
		-- 	end,
		-- },
		hl = { bg = "#000000", fg = "#0E3733" },
	}

    ---------------
	-- FILE INFO --
    ---------------

	local FilePath = {
		on_click = {
			callback = function()
				vim.cmd("NvimTreeToggle")
			end,
			name = "heirline_nvimtree",
		},
		provider = function(self)
			local file_path = " " .. vim.fn.fnamemodify(self.filename, ":.") .. " "
			if file_path == "" then
				return " [No Name] "
			end
			if not conditions.width_percent_below(#file_path, 0.25) then
				file_path = vim.fn.pathshorten(file_path)
			end
			return file_path
		end,
		hl = { bg = "#000000", fg = "#24655D" },
	}

	local FileFlags = {
		{
			condition = function()
				return vim.bo.modified
			end,
			create_symbol("[+] ", "#000000", "#A1E8E2"),
		},
		{
			condition = function()
				return not vim.bo.modifiable or vim.bo.readonly
			end,
			create_symbol(" ", "#000000", "#A1E8E2"),
		},
	}

	local FileNameBlock = {
		init = function(self)
			self.filename = vim.api.nvim_buf_get_name(0)
		end,
		condition = conditions.buffer_not_empty,
		h1 = { bg = "#000000", fg = "#1C4F49" },
		FilePath,
		FileFlags,
	}

	local FileEncoding = {
		provider = function()
			local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
			return (" %s "):format(enc:upper())
		end,
		hl = { bg = "#000000", fg = "#1C4F49" },
	}

    -------------
	-- TABLINE --
    -------------

	-- local function highlight_buf(self)
	-- 	if self.is_active or self.is_visible then
	-- 		return { bg = "#000000", fg = "#E8DEC9" }
	-- 	end
	-- 	return { bg = "#000000", fg = "#655843" }
	-- end

	-- local TablineFileName = {
	-- 	provider = function(self)
	-- 		local filename = self.filename
	-- 		filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
	-- 		return filename .. " "
	-- 	end,
	-- 	hl = highlight_buf,
	-- }

	-- local TablineFileFlags = {
	-- 	{ -- Modified
	-- 		condition = function(self)
	-- 			return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
	-- 		end,
	-- 		create_symbol("[+]", "#000000", "#E8DEC9"),
	-- 	},
	-- 	{ -- Not Modifiable/Readonly
	-- 		condition = function(self)
	-- 			return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
	-- 				or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
	-- 		end,
	-- 		provider = function(self)
	-- 			if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
	-- 				return "  "
	-- 			else
	-- 				return "  "
	-- 			end
	-- 		end,
	-- 		hl = highlight_buf,
	-- 	},
	-- }

	-- local TablineFileNameBlock = {
	-- 	init = function(self)
	-- 		self.filename = vim.api.nvim_buf_get_name(self.bufnr)
	-- 	end,
	-- 	on_click = {
	-- 		callback = function(_, minwid, _, button)
	-- 			if button == "m" then
	-- 				vim.schedule(function()
	-- 					vim.api.nvim_buf_delete(minwid, { force = false })
	-- 				end)
	-- 			else
	-- 				vim.api.nvim_win_set_buf(0, minwid)
	-- 			end
	-- 		end,
	-- 		minwid = function(self)
	-- 			return self.bufnr
	-- 		end,
	-- 		name = "heirline_tabline_buffer_callback",
	-- 	},
	-- 	create_symbol(" ", "#000000", "#655843"),
	-- 	TablineFileName,
	-- 	TablineFileFlags,
	-- }

	-- local TablineBufferBlock = utils.surround({ "", "" }, function(self)
	-- 	if self.is_active then
	-- 		return utils.get_highlight("TabLineSel").bg
	-- 	else
	-- 		return utils.get_highlight("TabLine").bg
	-- 	end
	-- end, { TablineFileNameBlock })
	--
	-- local get_bufs = function()
	-- 	return vim.tbl_filter(function(bufnr)
	-- 		return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
	-- 	end, vim.api.nvim_list_bufs())
	-- end

	-- local TabLineOffset = {
	-- 	condition = function(self)
	-- 		self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
	-- 	end,
	--
	-- 	provider = function(self)
	-- 		local title = self.title
	-- 		local width = vim.api.nvim_win_get_width(self.winid)
	-- 		local pad = math.ceil((width - #title) / 2)
	-- 		return string.rep(" ", pad) .. title .. string.rep(" ", pad)
	-- 	end,
	--
	-- 	hl = function(self)
	-- 		if vim.api.nvim_get_current_win() == self.winid then
	-- 			return "TablineSel"
	-- 		else
	-- 			return "Tabline"
	-- 		end
	-- 	end,
	-- }

	-- local BufferLine = utils.make_buflist(
	-- 	TablineBufferBlock,
	-- 	create_symbol(" ", "#000000", "#655843"),
	-- 	create_symbol(" ", "#000000", "#655843"),
	-- 	function()
	-- 		return buflist_cache
	-- 	end,
	-- 	false
	-- )

	-- Render Tabline
	-- local buflist_cache = {}
	-- vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "BufAdd", "BufDelete" }, {
	--     callback = function()
	--         vim.schedule(function()
	--             local buffers = get_bufs()
	--             for i, v in ipairs(buffers) do
	--                 buflist_cache[i] = v
	--             end
	--
	--             for i = #buffers + 1, #buflist_cache do
	--                 buflist_cache[i] = nil
	--             end
	--
	--             if #buflist_cache > 1 then
	--                 vim.o.showtabline = 2
	--             elseif vim.o.showtabline ~= 1 then
	--                 vim.o.showtabline = 1
	--             end
	--         end)
	--     end,
	-- })

	heirline.setup({
		statusline = {
			ViMode,
            Git,
			FileNameBlock,
			Space,
			{ provider = "%=" }, -- Align
			{ provider = "%<" },
			Diagnostics,
            -- create_symbol("", "#000000", "#0E3733"),
			create_symbol(" 󱗼", "#000000", "#0E3733"),
			FileEncoding,
			create_symbol("󱗼", "#000000", "#0E3733"),
			create_symbol(" %3l:%c ", "#000000", "#1C4F49"),
			create_symbol("󱗼 ", "#000000", "#0E3733"),
		},
		-- tabline = {
		-- 	TabLineOffset,
		-- 	BufferLine,
		-- },
	})
end

return {
	"rebelot/heirline.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"neovim/nvim-lspconfig",
	},
	config = setup_heirline,
}
