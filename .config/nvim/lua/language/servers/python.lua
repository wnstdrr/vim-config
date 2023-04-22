local config = require('language.lsp')

local server = config.make({
	cmd = { "anakinls" },
	name = 'python',
	filetypes = { 'py', 'pyc' },
})
