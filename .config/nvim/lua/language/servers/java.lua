local config = require('language.lsp')

local server = config.make({
    cmd = { "jdtls", "-configuration", "/home/user/.cache/jdtls/config", "-data", "/home/user/.cache/jdtls/workspace" },	
	name = 'java',
	filetypes = { 'java', '.class' },
})
