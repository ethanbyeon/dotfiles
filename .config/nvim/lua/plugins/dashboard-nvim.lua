local header = {
    "⣿⢋⣋⣛⣛⣛⣛⣛⣛⢛⠛⡛⡛⣛⠛⣛⡛⣛⡛⣛⡛⡛⡛⢛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠻⠛⠟⠟⠟⠟⠟⠟⠿⠻⠿⠻⠿⠻⠻⠻⠻⠟⠿⠿⠿⠿⠿⠿⠿⠻⠿⠿⠿⣿",
    "⣿⢨⣛⠿⣿⣿⣿⣿⣿⣿⣦⣇⠜⠑⡵⡪⡙⢮⡻⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⢟⡽⡟⣭⡶⡻⠑⢡⡴⣟⣯⣾⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡂⣿",
    "⣿⢸⣿⣿⣶⣯⣝⡻⢿⣿⣿⣿⣿⣾⣤⡜⢜⣕⣍⣳⣽⣿⠇⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣤⣤⣄⣀⣀⠀⠀⠀⠀⠀⢸⣿⣽⢋⣪⠞⠝⣤⡼⣞⣵⡈⢟⣻⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠂⣿",
    "⣿⠈⢟⢻⠿⣿⣿⣿⣿⣾⣽⣻⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⢰⣾⣿⣿⡯⢿⣿⣿⣿⣿⣿⣿⣿⢏⣷⣦⠀⠀⢸⣿⣿⣿⣯⣾⣻⣵⣿⣿⣿⠿⡎⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠔⣿",
    "⣿⢰⣯⣴⣆⣱⠌⣉⠟⢻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠐⠒⠉⡅⢸⣿⣿⡿⣿⣿⣿⣹⣿⢿⣿⠿⣿⣿⣿⣿⠄⡀⢸⣿⣿⣿⣿⣿⡿⣟⣻⡽⢶⠛⡍⢸⣿⣿⣿⣷⣿⣿⡿⠋⢹⣿⡟⠙⢻⣿⢂⣿",
    "⣿⢸⣶⣾⣭⣽⣟⣓⡾⠯⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠕⠔⢡⠘⠋⢄⣂⠈⠙⢿⣿⣿⢰⣿⣹⣿⡿⠟⠻⠀⠨⢸⣿⣿⣿⣿⣷⣿⣏⣡⣣⣮⣼⣶⢸⣿⣿⣿⣿⣿⣟⠁⢠⣾⡟⠀⣰⣿⣿⠰⣿",
    "⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡂⠨⡆⣀⣾⣧⣞⠍⡉⠡⡀⠀⠈⢛⣸⡧⠉⠀⠀⢒⠕⢂⠀⢸⣿⣿⣿⣿⣿⣿⢿⣟⣛⣿⣭⡍⣾⣿⣿⣿⣿⣿⠃⣰⣿⡿⠁⣼⣿⣿⣿⢐⣿",
    "⣿⢸⣿⣛⣛⣛⣻⣿⡿⡿⠿⠿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠭⡀⢃⢿⣿⣿⣤⣜⡯⠤⠿⠦⢷⣵⣿⡄⡤⣎⣈⡷⢙⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣱⣿⣿⣿⣿⣿⣷⢼⣿⣿⣧⣾⣿⣿⣿⣿⡨⣿",
    "⣿⠈⠛⠛⠛⠛⡛⠻⠻⠻⠿⢿⣿⣿⣿⣶⣿⣿⣿⣿⣿⡟⡤⢄⢣⣽⣿⣿⣿⣿⡿⣏⣵⣿⣿⣿⣿⣿⣯⣕⡲⣾⣿⣿⡇⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⣿⣿⣿⣿⣿⣏⢀⣸⣿⡃⢀⣼⣿⣿⣿⣿⢱⣿",
    "⣿⢐⣳⣳⣾⢾⢫⣯⣯⡩⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠙⣾⠷⡹⠻⠿⣿⢻⢹⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢧⢹⣿⣿⣿⣿⣿⣿⣿⣿⢣⠿⣛⣭⡭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣿",
    "⣿⢸⣿⣿⣱⣿⣾⣿⣿⣏⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⢳⣟⠝⢠⣞⣠⣹⣿⣿⣶⣿⣿⣏⠉⠾⠒⢹⣿⣿⣿⣿⢋⠸⡇⡜⣿⣿⣿⣿⣿⣿⡿⣡⣷⣿⡿⣏⡼⢒⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢐⣿",
    "⣿⢸⣿⣿⣜⣻⢿⣿⣿⣏⣼⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣎⢯⢁⡐⢸⣿⣿⣿⣿⣿⣿⡿⣻⣭⣭⣭⣭⢿⣿⣿⡟⣿⣿⢸⢴⣸⣿⣿⣿⣿⣿⣫⣾⣿⣿⣿⣿⣯⣶⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿",
    "⣿⢸⣿⣿⣿⣿⣮⣛⢟⣼⣛⠯⠝⢶⢻⣿⠿⣿⣿⣿⣿⣿⣎⢷⣿⢸⣿⣿⣿⣿⣿⣯⣞⣫⠵⠶⠷⠯⠳⣻⣿⣇⣿⡇⢬⣆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣭⣟⡿⢿⢱⢿⣻⣭⣷⣶⣶⣾⣍⡛⢿⣿⠰⣿",
    "⣿⠸⢿⣛⡯⠽⡓⠮⣉⢥⢐⡦⣝⣮⣽⣾⣿⣿⣿⣿⣿⣿⣿⢨⣭⢸⣿⣿⣫⢿⣿⣷⣝⡿⠿⠿⠿⠿⡿⣽⣿⣙⣿⡇⣚⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⢇⣵⣯⣽⣻⠿⣿⣿⣿⣿⣿⣦⡙⢘⣿",
    "⣿⠨⢙⡂⠬⢰⡠⢥⣲⣽⣶⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⡌⠻⢿⣿⣿⣿⣿⣣⣂⣠⣤⣤⣄⡐⣹⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢅⡪⢝⡻⢿⣿⣿⣷⣾⣭⣟⣻⠿⣿⢰⣿",
    "⣿⠨⢴⣒⣯⣷⣾⣿⣿⡿⣛⣭⣾⣿⣿⠿⢟⣿⣿⣿⣿⣿⡏⣼⢹⣿⣶⡀⣉⠻⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⡿⠋⢲⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣑⠣⢌⡹⢺⢽⣛⠿⣿⣿⣿⣿⣶⢸⣿",
    "⣿⢸⣿⣿⣿⡿⢟⣯⣷⣿⣿⠿⡋⣋⣰⣾⠿⣫⣿⣿⢟⢽⢡⣿⡟⣿⠟⣿⣖⠦⡀⠙⠿⠿⡿⡿⡿⠿⠿⠋⣠⢂⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣟⡻⣵⣶⣟⢝⡷⣧⣜⢑⠢⣜⡙⢲⢭⣟⡻⢿⢨⣿",
    "⣿⢸⢿⣫⣵⣾⡿⣿⢟⡋⠑⣰⣴⡿⠟⢁⣵⣿⠟⢕⡵⢣⣾⣿⣗⢞⢿⣿⣿⣷⡤⡤⡀⠄⠄⢄⣄⡈⢠⢔⠅⣼⣿⣿⣿⣿⡿⣯⣻⣿⣿⣿⣿⢾⣿⣿⣿⣿⣿⣟⣜⢿⣾⣝⡿⣾⣤⡉⡗⠦⣜⠙⠳⢸⣿",
    "⣿⠸⠿⢿⢋⠕⠁⠀⢀⠈⠉⠉⠉⠲⠿⠿⠟⢡⠼⡫⣴⣿⡟⣏⣷⡄⢽⣿⣿⣿⣿⣦⣌⣘⠮⡪⡪⡪⣢⣿⢠⣿⣿⣿⣿⣿⣟⣝⠷⡽⣟⣿⣿⣮⡏⣽⣿⣿⣿⣿⣿⢾⣿⣿⣿⣾⣝⡻⣷⣧⣊⢉⠲⠸⣿",
    "⣿⢰⠗⠆⠆⠀⡖⣢⠥⢙⠀⠀⢜⠛⠓⡠⣂⠄⡩⠚⢿⣿⣿⣾⣿⣏⠥⣻⣿⣿⡞⣿⣷⣍⠳⣝⣮⢾⢿⡇⠼⣿⣿⣿⣿⣿⣿⣞⣆⡹⣞⢮⣻⣿⣿⣬⣚⠿⢟⣵⣷⣿⣿⣿⣿⣿⣿⣿⣶⣝⡻⣿⣾⢸⣿",
    "⣿⠈⢈⣤⣾⣬⡪⠊⢀⣽⣿⣦⡐⠉⢢⡨⢟⣤⣨⣪⣢⢙⢿⣿⣿⣷⡰⡱⢻⣿⣿⡩⢿⣿⣷⡷⡸⣷⣿⣧⠑⢢⠙⠻⢿⣿⣿⣿⣞⣦⠚⢯⢳⡽⣿⣿⣿⣷⣝⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣽⠰⣿",
    "⣿⣤⣤⣤⣤⣤⣬⣤⣬⣤⣬⣬⣬⣤⣤⣥⣬⣭⣥⣥⣥⣥⣤⣭⣭⣭⣥⣥⣭⣭⣭⣥⣥⣭⣭⣭⣬⣭⣭⣥⣤⣬⣬⣥⣤⣬⣭⣭⣭⣬⣥⣭⣥⣭⣬⣭⣭⣭⣭⣥⣭⣭⣭⣭⣭⣭⣭⣭⣭⣭⣭⣭⣭⣼⣿",
    "                                                                  SLAM DUNK",
	"NVIM v" .. vim.version().major .. "." .. vim.version().minor,
    "",
}

local center = {
	{
		desc = "FIND FILE                     ",
		keymap = "",
		key = "SPC f f",
		key_format = " %s",
		icon = "  ",
		action = "Telescope find_files",
	},
	{
		desc = "RECENT FILES",
		keymap = "",
		key = "SPC f r",
		key_format = " %s",
		icon = "󰈙  ",
		action = "Telescope oldfiles",
	},
	-- {
	-- 	desc = "NEW FILE",
	-- 	keymap = "",
	-- 	key = "n",
	-- 	key_format = " %s",
	-- 	icon = "  ",
	-- 	action = "enew",
	-- },
	{
		desc = "EXIT",
		keymap = "",
		key = "q",
		key_format = " %s",
		icon = "  ",
		action = "exit",
	},
}

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	lazy = false,
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = header,
				center = center,
				footer = function()
					return {
						"STARTUP: " .. require("lazy").stats().startuptime .. " ms",
					}
				end,
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
