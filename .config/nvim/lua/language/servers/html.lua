local config = require('language.lsp')

local server = config.make({
  cmd = { 'vscode-html-language-server', '--stdio' },
  name = 'html',
  filetypes = { 'html' },
})

return server
