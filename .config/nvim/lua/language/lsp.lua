local l = require("language.lang")
local lspz = require("lsp-zero")
local treesitter = require("nvim-treesitter.configs")

lspz.preset("recommended")
lspz.setup()

-- Configure Mason language servers
require("mason-lspconfig").setup({
    ensure_installed = l.lang.mason_languages,
    automatic_installation = true,
})

require('lspconfig').lua_ls.setup({
    -- ... other configs
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
    workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
    },
    telemetry = {
        enable = false,
    }
})

treesitter.setup({
    ensure_installed = l.lang.languages,
    ignore_install = l.lang.ignore_languages,
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
    },
    additional_vim_regex_highlighting = false,
})

l.RegisterLanguages({
    json = {
        language = "json5",
        filetype = "jsonc",
    },
    pythonc = {
        language = "python",
        filetype = "pyc",
    },
})

-- Configure nice-reference popup display
require('nice-reference').setup({
    anchor = "NW",       -- Popup position anchor
    relative = "cursor", -- Popup relative position
    row = 1,             -- Popup x position
    col = 0,             -- Popup y position
    border = "rounded",  -- Popup borderstyle
    winblend = 12,       -- Popup transaparency 0-100, where 100 is transparent
    max_width = 128,     -- Max width of the popup
    max_height = 64,     -- Max height of the popup
    auto_choose = false, -- Go to reference if there is only one
})
