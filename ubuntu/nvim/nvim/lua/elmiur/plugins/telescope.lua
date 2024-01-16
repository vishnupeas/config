return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
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
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        -- adds fzf to telescope search
        require('telescope').load_extension('fzf')

        vim.keymap.set('n', '<leader>pff', builtin.find_files, { desc = "Project find files"})
        vim.keymap.set('n', '<leader>gff', builtin.git_files, { desc = "Git find files" })
        vim.keymap.set('n', '<leader>pfw', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end, { desc = "Project find word" })
    end,
}
