return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        view = {
            width = 34,
            relativenumber = true,
        },
        -- change folder arrow icons
        renderer = {
            indent_markers = {
                enable = true,
            },
            icons = {
                glyphs = {
                    folder = {
                        arrow_closed = "", -- arrow when folder is closed
                        arrow_open = "", -- arrow when folder is open
                    },
                },
            },
        },
        -- disable window_picker for
        -- explorer to work well with
        -- window splits
        actions = {
            open_file = {
                window_picker = {
                    enable = false,
                },
            },
        },
        filters = {
            custom = { ".DS_Store" },
        },
        git = {
            ignore = false,
        },
        view = {
            side = "right"
        },
    },
    keys = {
        {"<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
        {"<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
        {"<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
        {"<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
    },
    config = function(_, opts)
        local nvimtree = require("nvim-tree")

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

        -- configure nvim-tree
        nvimtree.setup(opts)
    end,
}
