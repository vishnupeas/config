return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		local ascii_header = [[
        _             _
   ___ |@| _ __ ___  (@) _   _  _ __
  / _ \| || '_ ` _ \ | || | | ||@'__|
 @  __/| || | | | | || || |_| || |
  \___||_||_| |@| |_||_| \__,_||_|
    ]]

		local function center_header(header)
			local lines = {}
			for line in string.gmatch(header, "[^\n]+") do
				table.insert(lines, line)
			end

			local width = vim.api.nvim_win_get_width(0) -- Get the width of the current window
			local padding = math.floor((width - #lines[1]) / 12) -- Calculate padding based on the first line length
			for i, line in ipairs(lines) do
				lines[i] = string.rep(" ", padding) .. line
			end
			return lines
		end

		local custom_header = center_header(ascii_header)

		startify.section.header.val = custom_header

		-- add margins to the top and left
		startify.opts.layout[1].val = 5
		startify.opts.opts.margin = 60

		-- disable MRU
		startify.section.mru.val = {}

		-- Set menu
		startify.section.top_buttons.val = {
			startify.button("e", " > New File", "<cmd>ene<CR>"),
			startify.button("SPC e e", " > Toggle file explorer", "<cmd>Neotree toggle current reveal_force_cwd<CR>"),
			startify.button("SPC f o", " > Recently Opened", "<cmd>Telescope find_files<CR>"),
			startify.button("SPC f f", " > Find File", "<cmd>Telescope find_files<CR>"),
			startify.button("SPC f s", " > Find Word", "<cmd>Telescope live_grep<CR>"),
			startify.button("SPC w r", " > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
		}

		-- Send config to alpha
		alpha.setup(startify.config)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
