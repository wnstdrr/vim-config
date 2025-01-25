local bndr = require("core.utilities.bind")
local object = require("core.utilities.object")

Spyglass = require("telescope.builtin")
SpyglassTheme = require("telescope.themes")
Browser = require("telescope").load_extension("file_browser")

-- Enable defaults
bndr.fbindmap(
    { "expandtab",
        "hlsearch", "ignorecase",
        "number", "relativenumber",
        "ruler", "showmatch",
        "smartcase", "incsearch",
        "splitbelow",
        "splitright"
    }, true
)

-- Bind tabs and shift width
bndr.fbindmap(
    { "tabstop", "softtabstop", "shiftwidth" }, 4
)

bndr.bindmap("conceallevel", 2)
bndr.bindmap("concealcursor", "nc")

bndr.bindmap("encoding", "utf-8")

bndr.bindmap("mouse", "nvi")

bndr.bindmap("cmdheight", 1)

-- Share clipboard with system
bndr.bindmap("clipboard", vim.opt.clipboard._value .. "unnamedplus")

-- LSP update time
bndr.bindmap("updatetime", 128)

vim.wo.signcolumn = "yes"
vim.g.mapleader = ","

-- local initDirectory = vim.fn.expandcmd('%:p:h')

-- Bind physical mappings
bndr.physmapMulti({
    defaults = {
        silent = true,
    },
    {
        -- Neotree
        mode = "n",
        lhs = "5",
        rhs = [[<cmd>Neotree toggle<CR>]],
        opt = {
            noremap = true
        }
    },
    {
        mode = "n",
        lhs = "<C-Right>",
        rhs = [[<cmd>BufferNext<CR>]],
        opt = {
            noremap = true,
        },
    },
    {
        mode = "n",
        lhs = "<C-Left>",
        rhs = [[<cmd>BufferPrevious<CR>]],
        opt = {
            noremap = true,
        },
    },
    {
        -- Nice references
        mode = "n",
        lhs = "<C-LeftMouse>",
        rhs = [[<cmd>lua require('nice-reference').references()<CR>]],
    },
    {
        -- Telescope find in files
        mode = "n",
        lhs = "1",
        rhs =
        [[<cmd>lua Spyglass.find_files({ no_ignore = true, prompt_title = 'Search?', preview_title = '...', cwd = initDirectory, manual_mode = true }); print(initDirectory)<CR>]]
    },
    {
        -- Telescope buffers
        mode = "n",
        lhs = "2",
        rhs =
        [[<cmd>lua Spyglass.buffers(SpyglassTheme.get_cursor({ no_ignore = true, prompt_title = 'Buffer?', preview_title = '...', layout_config = { width = 0.8 } }))<CR>]]
    },
    {
        -- Telescope live grep (ripgrep)
        mode = "n",
        lhs = "3",
        rhs =
        [[<cmd>lua Spyglass.live_grep({ no_ignore = true, prompt_title = 'Grepper?', preview_title = '...', cwd = initDirectory })<CR>]]
    },
    {
        -- Telescope help tags
        mode = "n",
        lhs = "4",
        rhs = [[<cmd>lua Spyglass.help_tags()<CR>]]
    },
    {
        -- Codeium acception
        mode = "i",
        lhs = "<Tab>",
        rhs = function()
            return vim.fn['codeium#Accept']()
        end,
        opt = {
            expr = true,
            noremap = true,
        },
    },
    {
        -- Codeium cycle forward
        mode = "i",
        lhs = "<c-;>",
        rhs = function()
           return vim.fn['codeium#CycleCompletions'](1)
        end,
        opt = {
            expr = true,
        },
    },
    {
        -- Codeium cycle backward
        mode = "i",
        lhs = "<c-,>",
        rhs = function()
            return vim.fn['codeium#CycleCompletions'](-1)
        end,
        opt = {
            expr = true,
        },
    },
    {
        -- Codeium clear completion
        mode = "i",
        lhs = "<c-x>",
        rhs = function()
            return vim.fn['codeium#Clear']()
        end,
        opt = {
            expr = true,
        },
    },
})
