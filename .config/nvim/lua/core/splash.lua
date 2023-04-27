-- Unused due to a current bug I don't feel like fixing right now
local splash = require('startup')

section1 = {
    type = "text", -- can be mappings or oldfiles
    oldfiles_directory = false, -- if the oldfiles of the current directory should be displayed
    align = "center", -- "center", "left" or "right"
    fold_section = false, -- whether to fold or not
    title = "title", -- title for the folded section
    margin = 5, -- the margin for left or right alignment
    content = {
        "143 162 165 151 163 145  055  143 157 156 164 162 157 154"
    },
    highlight = "String", -- highlight group in which the section text should be highlighted
    default_color = "#FC032C", -- a hex color that gets used if you don't specify `highlight`
    oldfiles_amount = 5, -- the amount of oldfiles to be displayed
}


splash.setup({
    section_1 = section1,
    options = {
      mapping_keys = true, -- display mapping (e.g. <leader>ff)

      -- if < 0 fraction of screen width
      -- if > 0 numbers of column
      cursor_column = 0.5,

      after = function() -- function that gets executed at the end
      
      end,
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
    folded_section = "#56b6c2", -- the color of folded sections
      -- this can also be changed with the `StartupFoldedSection` highlight group
  },
  parts = { "section_1" }, -- all sections in order
})
splash.setup({ theme = 'dashboard' })
