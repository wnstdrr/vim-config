local P = { }

P.bootstrapd = true

P.PackerBootstrap = function()
  local fn = vim.fn
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

P.bootstrap = P.PackerBootstrap()
P.packer = require("packer")

if not P.packer then
  P.bootstrapd = false
end

if P.bootstrap and P.bootstrapd then
    P.packer.sync()
    P.packer.compile()
  end

return P
