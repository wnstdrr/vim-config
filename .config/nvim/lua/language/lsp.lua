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
