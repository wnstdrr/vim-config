local B = { }

local object = require("core.utilities.object")
local keymap = vim.keymap.set

-- Bind single method to value
B.bindmap = function(method, value)
  vim.opt[method] = value
end

-- Bind `n` methods to value
B.fbindmap = function(methods, value)
  for _, v in pairs(methods) do
    B.bindmap(v, value)
  end
end

-- Map single physical key
function B.physmap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_deep_extend("force", options, opts)
    end
    keymap(mode, lhs, rhs, options)
end

-- Map `n` physical keys within table
function B.physmapMulti(config)
    for k, v in pairs(config) do
        if config[k].opt then
            config[k].opt = object.merge_table(config.defaults, config[k].opt)
        end
        if v.mode or v.lhs or v.rhs or v.opt then
            keymap(v.mode, v.lhs, v.rhs, v.opt)
        end
    end
end


return B
