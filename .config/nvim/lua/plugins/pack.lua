Pkg = require("packer")
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local ensure_packer = function()
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        return true
    end
    return false
end

if ensure_packer() then
    Pkg.sync()
end

