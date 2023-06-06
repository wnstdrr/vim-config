--[[
-- ██╗     ███████╗██████╗
-- ██║     ██╔════╝██╔══██╗
-- ██║     ███████╗██████╔╝
-- ██║     ╚════██║██╔═══╝
-- ███████╗███████║██║
-- ╚══════╝╚══════╝╚═╝
]]--

-- LSP utilities

local lspz = require("lsp-zero")
local lang = require("language.lang")

lspz.preset("recommended")
lspz.setup()

-- Configure Mason language servers
require("mason-lspconfig").setup({
    --ensure_installed = lang.mason_languages,
    automatic_installation = true,
})


-- Configure tree-sitter file syntax rules
require("nvim-treesitter.configs").setup({
    ensure_installed = lang.languages, -- Language list
    ignore_install = lang.optional_languages,
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true
    },
    additional_vim_regex_highlighting = false
})

-- Configure lua ls
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
        },
        diagnostics = {
            globals = { "vim" },
        },
        workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
            enable = false,
        },
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
