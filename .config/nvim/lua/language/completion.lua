local cmp = require("cmp")
local cmap = cmp.mapping
local window = cmp.config.window

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  window = {
      completion = window.bordered(),
  },
  mapping = cmap.preset.insert({
      ['<C-b>'] = cmap.scroll_docs(-4),
      ['<C-f>'] = cmap.scroll_docs(4),
      ['<C-o>'] = cmap.complete(),
      ['<C-e>'] = cmap.abort(),
      ['<CR>'] = cmap.confirm({ select = true }),
    }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
})
