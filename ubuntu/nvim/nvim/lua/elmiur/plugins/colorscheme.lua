return { 
	"catppuccin/nvim",
	name = "catppuccin", 
	priority = 1000,
	config = function ()
		-- Lua initialization file
		vim.cmd([[colorscheme catppuccin]])
	end,	
}
