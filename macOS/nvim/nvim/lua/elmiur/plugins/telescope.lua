return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- quickfix list
					},
				},
			},
		})

		-- adds fzf to telescope search
		require("telescope").load_extension("fzf")

		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recently opened" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in cwd" })
		vim.keymap.set("n", "<leader>fgf", builtin.git_files, { desc = "Git find files" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
		vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
	end,
}
