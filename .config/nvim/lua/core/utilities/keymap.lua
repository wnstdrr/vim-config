-- Keymapping utilities
local keymap = vim.keymap.set

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    keymap(mode, lhs, rhs, options)
end
