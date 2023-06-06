--[[
-- ██╗  ██╗███████╗██╗   ██╗███╗   ███╗ █████╗ ██████╗ 
-- ██║ ██╔╝██╔════╝╚██╗ ██╔╝████╗ ████║██╔══██╗██╔══██╗
-- █████╔╝ █████╗   ╚████╔╝ ██╔████╔██║███████║██████╔╝
-- ██╔═██╗ ██╔══╝    ╚██╔╝  ██║╚██╔╝██║██╔══██║██╔═══╝ 
-- ██║  ██╗███████╗   ██║   ██║ ╚═╝ ██║██║  ██║██║     
-- ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝
]]--

-- Keymapping utilities

local OBJ = require('core.utilities.object')

K = {}
local keymap = vim.keymap.set

-- Map multiple keys within table
function K.mapA(config)
    for k, v in pairs(config) do
        if config[k].opt then
            config[k].opt = OBJ.merge_table(config.defaults, config[k].opt)
        end
        if v.mode or v.lhs or v.rhs or v.opt then
            keymap(v.mode, v.lhs, v.rhs, v.opt)
        end
    end
end

-- Map individual key
function K.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_deep_extend("force", options, opts)
    end
    keymap(mode, lhs, rhs, options)
end

return K
