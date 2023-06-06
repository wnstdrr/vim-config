--[[
--  ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗████████╗██╗ ██████╗ ███╗   ██╗
-- ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║
-- ██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗     ██║   ██║██║   ██║██╔██╗ ██║
-- ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     ██║   ██║██║   ██║██║╚██╗██║
-- ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗   ██║   ██║╚██████╔╝██║ ╚████║
--  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
]]--

-- Completion utilities

local cmp = require("cmp")
local cmap = cmp.mapping
local window = cmp.config.window

cmp.setup({
    window = {
        completion = window.bordered(),
        documentation = window.bordered(),
    },
    mapping = cmap.preset.insert({
        ['<C-b>'] = cmap.scroll_docs(-4),
        ['<C-f>'] = cmap.scroll_docs(4),
        ['<C-o>'] = cmap.complete(),
        ['<C-e>'] = cmap.abort(),
        ['<CR>'] = cmap.confirm({ select = true }),
    }),
    enabled = function()
        local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
        if in_prompt then -- this will disable cmp in the Telescope window (taken from the default config)
            return false
        end
        local context = require("cmp.config.context")
        return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
    end,
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
    }),
})
