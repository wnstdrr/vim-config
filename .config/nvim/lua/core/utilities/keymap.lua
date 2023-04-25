-- Keymapping utilities

K = { }
local keymap = vim.keymap.set

function K.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_deep_extend('force', options, opts)
    end
    keymap(mode, lhs, rhs, options)
end

return K
