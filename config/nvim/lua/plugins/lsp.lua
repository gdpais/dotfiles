return {
    --TODO: manual config
    -- Keepers:
    -- "williamboman/mason.nvim"
    -- "williamboman/mason-lspconfig.nvim"
    -- Add (configure):
    -- "WhoIsSethDaniel/mason-tool-installer.nvim"
    -- "jose-elias-alvarez/null-ls.nvim"
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            -- "onsails/lspkind-nvim"

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    },
    {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup {
                library = { plugins = { "nvim-dap-ui" }, types = true },
            }
        end,
    },

}
