local function highlight(group, text)
	return string.format("%%#%s#%s", group, text)
end

local function get_mode()
	local mode_map = {
		["n"] = "NORMAL",
		["no"] = "0-PENDING",
		["v"] = "VISUAL",
		["V"] = "V-LINE",
		[""] = "V-BLOCK",
		["s"] = "SELECT",
		["S"] = "S-LINE",
		[""] = "S-BLOCK",
		["i"] = "INSERT",
		["ic"] = "INSERT",
		["R"] = "REPLACE",
		["Rv"] = "V-REPLACE",
		["c"] = "COMMAND",
		["cv"] = "VIM EX",
		["ce"] = "EX",
		["r"] = "PROMPT",
		["rm"] = "MOAR",
		["r?"] = "CONFIRM",
		["!"] = "SHELL",
		["t"] = "TERMINAL",
	}
	local mode = vim.api.nvim_get_mode().mode
	return string.format(" %s ", mode_map[mode] or "UNKNOWN")
end

local function get_filepath()
	local filepath = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
	if filepath == "" then
		return " [No Name] "
	end
	if vim.fn.winwidth(0) * 0.5 < #filepath then
		filepath = vim.fn.pathshorten(filepath)
	end
	return string.format(" %s ", filepath)
end

local function get_git_status()
	local git_status = vim.b.gitsigns_status_dict
	if not git_status then
		return ""
	end
	local branch = git_status.head or "Unknown"
	vim.api.nvim_set_hl(0, "StatuslineGitSymbol", { fg = "#4C4C4C", bg = "#000000" })
	vim.api.nvim_set_hl(0, "StatuslineGitBranch", { fg = "#A6A6A6", bg = "#000000" })
	return table.concat({
		highlight("StatuslineGitSymbol", " 󰇛 "),
		highlight("StatuslineGitBranch", " "),
		branch,
	})
end

local function get_flags()
	local flags = {}
	if vim.bo.modified then
		table.insert(flags, "[+]")
	end
	if not vim.bo.modifiable or vim.bo.readonly then
		table.insert(flags, "")
	end
	return #flags > 0 and table.concat(flags, " ") .. " " or ""
end

Statusline = {}

Statusline.active = function()
	return table.concat({
		highlight("StatuslineMode", get_mode()),
		highlight("StatuslineSymbolOn", "󰀻 "),
		highlight("StatuslineFileText", get_filepath()),
		highlight("StatuslineFileText", get_flags()),
		get_git_status(),
		highlight("StatusLine", "%="),
		highlight("StatuslineSymbolOff", "󰀻"),
		highlight("StatuslineSymbolOn", " %3l:%c "),
		highlight("StatuslineSymbolOff", "󰀻 "),
	})
end

function Statusline.inactive()
	return "%#StatuslineSymbolOff# %F "
end

vim.api.nvim_set_hl(0, "StatusLine", { bg = "#000000" })
vim.api.nvim_set_hl(0, "StatuslineSymbolOff", { fg = "#184E41", bg = "#000000" })
vim.api.nvim_set_hl(0, "StatuslineSymbolOn", { fg = "#1E6251", bg = "#000000" })
vim.api.nvim_set_hl(0, "StatuslineMode", { fg = "#47C7A1", bg = "#000000" })
vim.api.nvim_set_hl(0, "StatuslineFileText", { fg = "#94F5D4", bg = "#000000" })

vim.api.nvim_exec(
	[[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au TermOpen * setlocal statusline=%!v:lua.Statusline.active()
  augroup END
]],
	false
)
