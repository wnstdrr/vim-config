local lsp = require("lsp-zero")
local lang = require("language.lang")
lsp.preset("recommended")
lsp.setup()

require("nvim-treesitter.configs").setup(
    {
        ensure_installed = lang.languages,
        ignore_install = lang.experimentallang,
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true
        },
        additional_vim_regex_highlighting = false
    }
)

