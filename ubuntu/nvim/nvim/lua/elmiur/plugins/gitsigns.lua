return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true,
	},
	config = function(_, opts)
		local gitsigns = require("gitsigns")
		gitsigns.setup(opts)
	end,
}
