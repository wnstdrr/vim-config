local scheme = vim.api.nvim_set_option
local schemec = vim.api.nvim_command
local schemeg = vim.g

-- Set colorscheme gruvbox
schemec('colorscheme gruvbox-flat')
schemeg.gruvbox_flat_style = 'hard'
schemeg.vem_tabline_show_icon = true
schemeg.vem_tabline_multiwindow_mode = true
require('lualine').setup({
    options = {
        theme = 'gruvbox-flat'
    }
})
