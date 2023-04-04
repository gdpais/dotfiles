return {
    -- Custom plugins
    -- e.g. { "asdf/dasf", dev = true } under ~/plugins

    -- All the stuff
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    "machakann/vim-sandwich",
    "folke/todo-comments.nvim",
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup()
        end
    },
    -- "laytan/cloak.nvim" -- if ever need to hide something
}
