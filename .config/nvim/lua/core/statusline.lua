--[[
-- ███████╗████████╗ █████╗ ████████╗██╗   ██╗███████╗      ██╗     ██╗███╗   ██╗███████╗
-- ██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██║   ██║██╔════╝      ██║     ██║████╗  ██║██╔════╝
-- ███████╗   ██║   ███████║   ██║   ██║   ██║███████╗█████╗██║     ██║██╔██╗ ██║█████╗  
-- ╚════██║   ██║   ██╔══██║   ██║   ██║   ██║╚════██║╚════╝██║     ██║██║╚██╗██║██╔══╝  
-- ███████║   ██║   ██║  ██║   ██║   ╚██████╔╝███████║      ███████╗██║██║ ╚████║███████╗
-- ╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝      ╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
]]--

local ll = require("lualine")
local fcl = require("fine-cmdline")

ll.setup {
    options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = { left = " | ", right = " | " },
        section_separators = { left = " > ", right = " | " },
        disabled_filetypes = {
            statusline = {},
            winbar = {}
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000
        }
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

fcl.setup(
    {
        cmdline = {
            enable_keymaps = true,
            smart_history = true,
            prompt = " : "
        },
        popup = {
            position = {
                row = "12%",
                col = "50%"
            },
            size = {
                width = "55%"
            },
            border = {
                style = "single"
            },
            win_options = {
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder"
            }
        },
        hooks = {
            before_mount = function(input)
                -- code (unused)
            end,
            after_mount = function(input)
                -- code (unused)
            end,
            set_keymaps = function(imap, feedkeys)
                -- code (unused)
            end
        }
    }
)
