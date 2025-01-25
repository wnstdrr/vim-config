local D = {}

D.board = {
    config = {
        theme = "hyper",          --  theme is doom and hyper default is hyper
        shortcut_type = "letter", --  shorcut type 'letter' or 'number'

        header = require("core.banner").gothic,
        footer = {
            [[  ]]
        },
        project = {
            enable = true,
            limit = 6,
            icon = "",
            action = [[Browser.file_browser({ select_buffer=true })]]
        },
        shortcut = {
            { desc = "[Theme] " .. vim.g.colors_name, group = "@property" },
            { desc = "[Welcome] " .. vim.fn.expand("$USER") .. "@" .. vim.fn.expand("$HOSTNAME")}
        },
        packages = { enable = true },
        hide = {
            statusline = true,
            tabline = true, -- hide the tabline
            winbar = true,  -- hide winbar
        },
    },
}

return D
