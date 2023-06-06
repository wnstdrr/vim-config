--[[
-- ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗
-- ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║
-- ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║
-- ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║
-- ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║
-- ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝
]]--

-- Plugin utilities
-- "our" code

require("plugins.pack")

return Pkg.startup(function(use)
    use {
        -- Default packages
        "wbthomason/packer.nvim",
        "ellisonleao/gruvbox.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-lualine/lualine.nvim",
        "nvim-neo-tree/neo-tree.nvim",
        "pacha/vem-tabline"
    }

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            {
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end
            },
            "williamboman/mason-lspconfig.nvim",
            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets"
        }
    }

    use {
        -- Finecmd
        "vonheikemen/fine-cmdline.nvim",
        requires = { "MunifTanjim/nui.nvim" }
    }

    use {
        -- Telescope
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { "nvim-lua/plenary.nvim" }
    }

    use {
        -- Nice references
        'wiliamks/nice-reference.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            { 'rmagatti/goto-preview', config = function() require('goto-preview').setup({}) end }
        },
    }

    use {
        -- Dashboard
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require("core.dashboard")
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use {
        -- Animation
        'echasnovski/mini.nvim',
        config = function()
            require('core.animate')
        end,
        branch = 'stable',
    }
end)
