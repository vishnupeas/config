local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- OR use all default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- remove some default mappings not to affect harpoon
    vim.keymap.del('n', '<C-t>', { buffer = bufnr })
    vim.keymap.del('n', '<C-e>', { buffer = bufnr })
    vim.keymap.del('n', '<C-k>', { buffer = bufnr })
    vim.keymap.del('n', '<C-x>', { buffer = bufnr })

    -- remap the keys to free ones
    vim.keymap.set('n', '<C-n>', api.node.open.tab, opts('Open: New Tab'))
    vim.keymap.set('n', '<C-o>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
    vim.keymap.set('n', '<C-i>', api.node.show_info_popup, opts('Info'))
    vim.keymap.set('n', '<C-s>', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
        on_attach = my_on_attach,
        view = {
            width = 34,
            relativenumber = true,
            side = "right",
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
        -- disable window_picker for explorer to work well with window splits
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
    },
    keys = {
        {"<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
        {"<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
        {"<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
        {"<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
    },
    config = function(_, opts)
        local nvimtree = require("nvim-tree")

        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

        -- configure nvim-tree
        nvimtree.setup(opts)
    end,
}
