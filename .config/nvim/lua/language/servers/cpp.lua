local config = require('language.lsp')

local server = config.make({
	cmd = { 'ccls' },
	name = 'cplusplus',
	filetypes = { 'cpp', 'h', 'o', 'so' },
})
