local window = cmp.config.window
local mapping = cmp.mapping.preset
local config = cmp.config
local setupfile = cmp.setup.filetype
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	window = {
		completion = window.bordered()
	},
	mapping = mapping.insert({
      ['<C-b>'] = mapping.scroll_docs(-4),
      ['<C-f>'] = mapping.scroll_docs(4),
      ['<C-Space>'] = mapping.complete(),
      ['<C-e>'] = mapping.abort(),
      ['<CR>'] = mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
	sources = config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
	}, {
		{ name = 'buffer' },
	})
})

setupfile('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Setup language server capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('language.lsp')['cplusplus'].setup {
    capabilities = capabilities
}

require('language.lsp')['java'].setup {
    capabilities = capabilities
}

require('language.lsp')['python'].setup {
    capabilities = capabilities
}

require('language.lsp')['html'].setup {
    capabilities = capabilities
}

