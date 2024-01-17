return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		-- Lua initialization file
		vim.cmd([[colorscheme catppuccin]])

		require("catppuccin").setup({
			integrations = {
				neotree = true,
				mason = true,
				alpha = true,
				cmp = true,
				treesitter = true,
				telescope = true,
			},
		})
	end,
}
