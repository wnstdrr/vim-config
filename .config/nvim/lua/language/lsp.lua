local lang = require('language.lang')

require('nvim-treesitter.configs').setup({
	ensure_installed = lang.alllang,
	-- ignore_install = lang.experimentallang,
	sync_install = false,
	auto_install = true,
		highlight = {
		enable = true
	},
	additional_vim_regex_highlighting = false,
})
