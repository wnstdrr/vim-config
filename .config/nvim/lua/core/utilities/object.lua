local O = {}

function O.inspect(o, tbs, tb)
    tb = tb or 0
    tbs = tbs or "  "
    if type(o) == "table" then
        local s = "{"
        if (next(o)) then
            s = s .. "\n"
        else
            return s .. "}"
        end
        tb = tb + 1
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            s = s .. tbs:rep(tb) .. "[" .. k .. "] = " .. O.inspect(v, tbs, tb)
            s = s .. ",\n"
        end
        tb = tb - 1
        return s .. tbs:rep(tb) .. "}"
    else
        return tostring(o)
    end
end

function O.spread_table(template)
    local result = {}
    for key, value in pairs(template) do
        result[key] = value
    end

    return function(table)
        for key, value in pairs(table) do
            result[key] = value
        end
        return result
    end
end

function O.merge_table(tbl1, tbl2)
    for _, value in ipairs(tbl2) do
        tbl1[#tbl1 + 1] = value
    end
    return tbl1
end

function O.buffers_loaded()
    local bufs_loaded = {}

    for i, buf_hndl in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf_hndl) then
            bufs_loaded[i] = buf_hndl
        end
    end

    return bufs_loaded
end

function O.buffers_unloaded()
    local bufs_loaded = {}

    for i, buf_hndl in ipairs(vim.api.nvim_list_bufs()) do
        bufs_loaded[i] = buf_hndl
    end

    return bufs_loaded
end

return O
