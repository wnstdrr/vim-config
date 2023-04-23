require('plugins.pack')

return pkg.startup(function(use)
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
      'nvim-lualine/lualine.nvim',
	  'ryanoasis/vim-devicons',
      'nvim-neo-tree/neo-tree.nvim',
      'pacha/vem-tabline',
      'BurntSushi/ripgrep',
      'sharkdp/fd'
  }

  use {
      'vonheikemen/fine-cmdline.nvim',
      requires = { 'MunifTanjim/nui.nvim' }
  }

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { 'nvim-lua/plenary.nvim', 'sharkdp/fd' },
  }
end)
