return {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>pff', builtin.find_files, { desc = "Project find files"})
		vim.keymap.set('n', '<leader>gff', builtin.git_files, { desc = "Git find files" })
		vim.keymap.set('n', '<leader>pfw', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end, { desc = "Project find word" })
	end,
}
