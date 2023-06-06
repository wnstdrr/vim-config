--[[
-- ███████╗ ██████╗██╗  ██╗███████╗███╗   ███╗ █████╗ 
-- ██╔════╝██╔════╝██║  ██║██╔════╝████╗ ████║██╔══██╗
-- ███████╗██║     ███████║█████╗  ██╔████╔██║███████║
-- ╚════██║██║     ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══██║
-- ███████║╚██████╗██║  ██║███████╗██║ ╚═╝ ██║██║  ██║
-- ╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝
]]--

-- Setup color schemes
-- TODO: Painfully re-create gruvbox theme, use plugin for now 

local scheme = vim.api.nvim_set_option
local schemec = vim.api.nvim_command
local schemeg = vim.g

-- Set colorscheme gruvbox
require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "soft",  -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
})
schemec('colorscheme gruvbox')

require('lualine').setup(
    {
        options = {
            theme = "gruvbox"
        }
    }
)

require('telescope').setup(
    {
        defaults = {
        },
        layout_config = {
            prompt_layout = 'top',
            center = {
                width = function(_, max_columns)
                    local percentage = 0.5
                    local max = 70
                    return math.min(math.floor(percentage * max_columns), max)
                end,
                height = function(_, max_rows)
                    local percentage = 0.5
                    local min = 70
                    return math.min(math.floor(percentage * max_rows), min)
                end
            }
        }
    }
)
