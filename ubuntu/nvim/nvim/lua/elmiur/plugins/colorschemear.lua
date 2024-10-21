return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		term_colors = true,
		transparent_background = false,
		dim_inactive = {
			enabled = false, -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15, -- percentage of the shade to apply to the inactive window
		},
		integrations = {
			neotree = true,
			mason = true,
			alpha = true,
			cmp = true,
			treesitter = true,
			telescope = true,
			gitsigns = true,
			harpoon = true,
			which_key = true,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
