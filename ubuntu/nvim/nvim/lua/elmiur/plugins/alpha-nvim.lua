return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local startify = require("alpha.themes.startify")

        startify.section.header.val = {
            [[             _             _               ]],
            [[        ___ | | _ __ ___  (_) _   _  _ __  ]],
            [[       / _ \| || '_ ` _ \ | || | | || '__| ]],
            [[      |  __/| || | | | | || || |_| || |    ]],
            [[       \___||_||_| |_| |_||_| \__,_||_|    ]],
        }

        -- add margins to the top and left
        startify.opts.layout[1].val = 2
        startify.opts.opts.margin = 45

        -- disable MRU
        startify.section.mru.val = { { type = "padding", val = 0 } }

        -- Set menu
        startify.section.top_buttons.val = {
            startify.button("e", " > New File", "<cmd>ene<CR>"),
            startify.button("SPC ee", " > Toggle file explorer", "<cmd>Neotree toggle current reveal_force_cwd<CR>"),
            startify.button("SPC pff", " > Find File", "<cmd>Telescope find_files<CR>"),
            startify.button("SPC pfw", " > Find Word", "<cmd>Telescope live_grep<CR>"),
            startify.button("SPC wr", " > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
        }

        -- Send config to alpha
        alpha.setup(startify.config)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
