local bind = vim.opt

-- Default file encoding
bind.encoding = 'utf-8'

-- Setup tabbing
bind.tabstop = 4
bind.softtabstop = 4
bind.shiftwidth = 4

-- Enable mouse feature
bind.mouse = 'nv'

-- Smartcase and ignore case
bind.ignorecase = true
bind.smartcase = true

-- Buffer number format
bind.relativenumber = true

-- Set cmd height
bind.cmdheight = 1

-- Refresh rate for lsp server in millis
bind.updatetime = 400
