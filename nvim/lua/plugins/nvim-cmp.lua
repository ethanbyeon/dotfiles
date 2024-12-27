local function setup_cmp()
	local cmp = require("cmp")

	vim.api.nvim_set_hl(0, "CmpMenu", { bg = "#000000", fg = "#B3A180" })
	vim.api.nvim_set_hl(0, "CmpSelect", { bg = "#B3A180", fg = "#000000", bold = true })

	cmp.setup({
		completion = {
			completeopt = "menu,menuone,preview,noselect",
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<S-Tab>"] = cmp.mapping.select_prev_item(),
			["<Tab>"] = cmp.mapping.select_next_item(),
			["<C-c>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = false }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		}),
		formatting = {
			format = require("lspkind").cmp_format({
				maxwidth = 50,
				ellipsis_char = "...",
			}),
		},
		window = {
			completion = cmp.config.window.bordered({
				winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenu,CursorLine:CmpSelect",
				side_padding = 1,
			}),
		},
	})

	require("luasnip.loaders.from_vscode").lazy_load()
end

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",           -- Source for text in buffer
		"hrsh7th/cmp-path",             -- Source for file system paths
		"hrsh7th/cmp-cmdline",          -- Source for command line
		"L3MON4D3/LuaSnip",             -- Snippet engine
		"saadparwaiz1/cmp_luasnip",     -- Autocompletion
		"rafamadriz/friendly-snippets", -- Snippets
		"onsails/lspkind.nvim",         -- VS Code like pictograms
	},
	config = setup_cmp,
}
