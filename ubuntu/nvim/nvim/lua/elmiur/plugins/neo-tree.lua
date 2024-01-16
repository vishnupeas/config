return{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        {
            "<leader>er",
            function()
                require("neo-tree.command").execute({ toggle = true, reveal = true, position = "right" })
            end,
            desc = "Explorer Right",
        },
        {
            "<leader>ee",
            function()
                require("neo-tree.command").execute({ toggle = true, reveal = true })
            end,
            desc = "Explorer Full",
        },
    },
    opts = {
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        default_component_configs = {
            indent = {
                expander_collapsed = "",
                expander_expanded = "",
            },
            modified = {
                symbol = "●",
            },
            name = {
                use_git_status_colors = false,
            },
            git_status = {
                symbols = {
                    -- Change type
                    added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted   = "",-- this can only be used in the git_status source
                    renamed   = "➜",-- this can only be used in the git_status source
                    -- Status type
                    untracked = "★",
                    ignored   = "◌",
                    unstaged  = "✗",
                    staged    = "✓",
                    conflict  = "",
                }
            },
        },
        window = {
            position = "current",
            width = 40,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
            mappings = {
                ["s"] = "open_split",
                ["v"] = "open_vsplit",
                ["%"] = {
                    "add",
                    config = {
                        show_path = "none" -- "none", "relative", "absolute"
                    }
                },
                ["d"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
                ["D"] = "delete",
                ["R"] = "rename",
                ["<F5>"] = "refresh",
            }
        },
        filesystem = {
            filtered_items = {
                visible = false, -- when true, they will just be displayed differently than normal items
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_hidden = true, -- only works on Windows for hidden files/directories
                hide_by_name = {
                    "node_modules"
                },
                hide_by_pattern = { -- uses glob style patterns
                    --"*.meta",
                    --"*/src/*/tsconfig.json",
                },
                always_show = { -- remains visible even if other settings would normally hide it
                    --".gitignored",
                },
                never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                    ".DS_Store",
                    "thumbs.db"
                },
                never_show_by_pattern = { -- uses glob style patterns
                    --".null-ls_*",
                },
            },
        },
    },
    config = function(_, opts)
        local neo_tree = require("neo-tree")

        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NeoTreeGitUntracked guifg=#FFFFFF ]])
        vim.cmd([[ highlight NeoTreeGitModified guifg=#FFFFFF ]])
        vim.cmd([[ highlight NeoTreeGitIgnored guifg=#FFFFFF ]])

        neo_tree.setup(opts)
    end
}
