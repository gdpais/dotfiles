return require('packer').startup(function(use)
    use("wbthomason/packer.nvim")

    --All the stuff
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lualine/lualine.nvim"
    use "nvim-telescope/telescope.nvim"
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use "ThePrimeagen/harpoon"

    --Completion
    --use "onsails/lspkind-nvim"
    --use "simrat39/symbols-outline.nvim"

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use { "tzachar/cmp-tabnine",  run = "./install.sh" , requires = "hrsh7th/nvim-cmp"}


    use "TimUntersberger/neogit"
    use "ThePrimeagen/git-worktree.nvim"
    use "sindrets/diffview.nvim"

    --Highlighting
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    --use "nvim-treesitter/playground" -- Change treesitter colors
    use { "norcalli/nvim-colorizer.lua" , config = function () require'colorizer'.setup() end }

    --Colorscheme
    use "folke/tokyonight.nvim"

    -- Debug adapter protocol
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"

    --Markdown
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
