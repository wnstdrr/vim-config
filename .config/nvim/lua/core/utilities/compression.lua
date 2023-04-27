-- Compression utilities:
-- Requires: gzip, bzip2, xz, tar

-- TODO: Implement compression algorithims with lua-zlib
-- Temporary work around using shell commands

local C = { }

local global = vim.api.nvim_create_user_command
local executor = vim.api.nvim_exec

local file = vim.fn.expand('%:p%:h')
local directory = vim.fn.expand('%:p:h')

local parseopts = function(opts)  -- Convert opt (compression level) to integer
    local opt = tonumber(opts.args) or nil
    return tonumber(opt)
end

function C.gzip(opts)
    local opt = parseopts(opts)

    if opt == nil then lvl = 6
    elseif opt ~= nil and lvl > 9 or lvl <= 0 then
        print('gzip compression must be 1:9, given ' .. lvl)
    end

    local compressed = file .. '.gz'
    print('gzip -> ' .. compressed)
    executor('!gzip -cv' .. lvl .. ' ' .. file .. ' > ' .. compressed, { output = false })
end

function C.bzip2(opts)
    local opt = parseopts(opts)
    if opt == nil then lvl = -9
    elseif opt ~= nil and lvl < -9 or lvl > -1 then
        print('bzip2 compression must be -1:-9, given ' .. lvl)
    end

    local compressed = file .. '.bz2'
    print('bzip2 -> ' .. compressed)
    executor('!bzip2 -k ' .. lvl .. ' ' .. file, { output = false })
end

function C.xz(opts)
    local opt = parseopts(opts)
    if opt == nil then lvl = -6
    elseif opt ~= nil and lbl < -9 or lvl > -6 then
        print('xz compression must be -6:-9, given ' .. lvl)
    end 

    local compressed = file .. '.xz'
    print('xz -> ' .. compressed)
    executor('!xz -k ' .. lvl .. ' ' .. file, { output = false })
end

function C.tar()
    local tarball = directory .. '.tar'

    print('tar -> ' .. tarball)
    executor('!tar -cvf ' .. tarball .. ' ' .. directory, { output = false }) 
end


global('Gzip', 
    function(opts)
        C.gzip(opts)
    end
, { nargs = '?', bang = true, desc = 'gzip compress current file' })

global('Bzip2',
    function(opts)
        C.bzip2(opts)
    end
, { nargs = '?', bang = true, desc = 'bzip2 compress current file' })

global('Xz',
    function(opts)
        C.xz(opts)
    end 
, { nargs = '?', bang = true, desc = 'xz compress current file' })

global('Tar',
    C.tar
, { nargs = '?', bang = true, desc = 'tar archive current directory' })

return C
