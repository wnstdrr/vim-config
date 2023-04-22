require('startup').setup({
	options = {	
		mapping_keys = true,
		cursor_column = 0.5,
		
		empty_lines_between_mappings = true, -- add an empty line between mapping/commands
		disable_statuslines = true, -- disable status-, buffer- and tablines
		paddings = {1,2}, -- amount of empty lines before each section (must be equal to amount of sections)
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		background = "#1f2227",
		folded_section = "#56b6c2",
	},
	parts = { 'section_1', 'section_2' }
})
require("startup").setup({ theme = 'dashboard' })

-- local settings = (<settings>)
-- return settings
