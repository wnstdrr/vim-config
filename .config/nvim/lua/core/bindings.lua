require('core.utilities.bindmap')
require('core.utilities.keymap')

local glass = require('telescope.builtin')

-- VIM Bindings 

-- Default boolean values
fbindmap({ 'expandtab', 'ignorecase', 'smartcase', 'relativenumber', 'ruler', 'hlsearch', 'incsearch', 'showmatch' }, true)

-- Setup tabbing
fbindmap({ 'tabstop', 'softtabstop', 'shiftwidth' }, 4)

-- Default file encoding
bindmap('encoding', 'utf-8')

-- Enable mouse feature
bindmap('mouse', 'nv')

-- Set cmd height
bindmap('cmdheight', 1)

-- Refresh rate for lsp server (in millis)
bindmap('updatetime', 400)


-- Physical Keybindings

map('n', '<F5>', '<cmd>Neotree<CR>', { silent = true })


-- Telescope keymappings
map('n', '<F1>', glass.find_files, { })
map('n', '<F2>', glass.buffers, { })
map('n', '<F3>', glass.live_grep, { })
map('n', '<F4>', glass.help_tags, { })
