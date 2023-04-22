local scheme = vim.api
setscheme = function(sch) 
    scheme.nvim_command('colorscheme ' .. sch)	
end

-- Set colorscheme gruvbox
setscheme('gruvbox-flat')

