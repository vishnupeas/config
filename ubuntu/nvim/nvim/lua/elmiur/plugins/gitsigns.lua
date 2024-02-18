return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true,
	},
	keys = {
		{
			"<leader>ghp",
			"<CMD>Gitsigns preview_hunk_inline<CR>",
			desc = "Gitsigns preview_hunk_inline",
		},
		{
			"<leader>ghs",
			"<CMD>Gitsigns stage_hunk<CR>",
			desc = "Gitsigns stage_hunk",
		},
		{
			"<leader>gbs",
			"<CMD>Gitsigns stage_buffer<CR>",
			desc = "Gitsigns stage_buffer",
		},
	},
	config = function(_, opts)
		local gitsigns = require("gitsigns")
		gitsigns.setup(opts)
	end,
}
