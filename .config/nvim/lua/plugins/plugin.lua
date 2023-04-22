local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command('packadd packer.nvim')
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use { 
	  'wbthomason/packer.nvim',           -- Package Manager
	  'eddyekofo94/gruvbox-flat.nvim',    -- Theme
	  'neovim/nvim-lspconfig',            -- Language Servers
	  'hrsh7th/nvim-cmp',                 -- Auto Complete
	  'mason-org/mason-registry',
	  'williamboman/mason.nvim',
	  'williamboman/mason-lspconfig.nvim',
	  'hrsh7th/cmp-nvim-lsp',             -- CMP Language Server
	  'hrsh7th/cmp-buffer',
	  'hrsh7th/cmp-look',
	  'nvim-treesitter/nvim-treesitter',  -- Extended Language Support
	  'L3MON4D3/LuaSnip', 
	  'saadparwaiz1/cmp_luasnip',
	  'rafamadriz/friendly-snippets',
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
