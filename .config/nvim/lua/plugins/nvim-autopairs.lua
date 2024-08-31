local function setup_autopairs()
	require("nvim-autopairs").setup({
		check_ts = true,
		ts_config = {
			c = { "string_literal", "comment", "source" },
			cpp = { "string_literal", "comment", "source" },
			lua = { "string", "comment", "source" },
			python = { "string", "comment", "source" },
		},
	})

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = setup_autopairs,
}
