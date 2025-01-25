local pkg = require("plugins.pack")

return pkg.packer.startup(function(use)
    use {
        "wbthomason/packer.nvim",
        "nvim-treesitter/nvim-treesitter",
        "williamboman/mason-lspconfig.nvim",
        "rebelot/kanagawa.nvim",
        "nvim-tree/nvim-web-devicons",
        "lewis6991/gitsigns.nvim",
        "romgrk/barbar.nvim",
        "windwp/windline.nvim",

        use {
            "nvim-neo-tree/neo-tree.nvim",
            requires = { "MunifTanjim/nui.nvim" }
        },

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
    }

    use {
        -- Dashboard
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require("dashboard").setup(
                require("core.dboard").board
            )
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use {
        -- Telescope
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" }
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
        'neoclide/coc-java',
    }

    --[[use {
        -- Animation
        'echasnovski/mini.nvim',
        config = function()
            require('core.animate')
        end,
        branch = 'stable',
    }--]]

    use {
        'tanvirtin/vgit.nvim',
        config = function()
            require('core.vsulgit')
        end,
        requires = {
            'nvim-lua/plenary.nvim',
        },
    }

    use { 'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup {}
    end
    }

end)
