local bmp = require("core.utilities.bindmap")
local kymp = require("core.utilities.keymap")

Spyglass = require("telescope.builtin")

-- VIM Bindings

-- Default boolean values
bmp.fbindmap(
    {"expandtab", "ignorecase", "smartcase", "relativenumber", "ruler", "hlsearch", "incsearch", "showmatch"},
    true
)

-- Setup tabbing
bmp.fbindmap({"tabstop", "softtabstop", "shiftwidth"}, 4)

-- Default file encoding
bmp.bindmap("encoding", "utf-8")

-- Enable mouse feature
bmp.bindmap("mouse", "nv")

-- Set cmd height
bmp.bindmap("cmdheight", 1)

-- Refresh rate for lsp server (in millis)
bmp.bindmap("updatetime", 400)

-- Physical Keybindings

kymp.map("n", "<F5>", "<cmd>Neotree<CR>", {silent = true})

-- Telescope keymappings
kymp.map("n", "<F1>", [[<cmd>lua  Spyglass.find_files({ no_ignore = true, prompt_title = 'Search?' })<CR>]], {})
kymp.map("n", "<F2>", Spyglass.buffers, {})
kymp.map("n", "<F3>", Spyglass.live_grep, {})
kymp.map("n", "<F4>", Spyglass.help_tags, {})

