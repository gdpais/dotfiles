return {
    -- "folke/tokyonight.nvim"
    {
        "tjdevries/colorbuddy.nvim",
        priority = 1000
    },
    {
        "tjdevries/gruvbuddy.nvim",
        dependencies = "tjdevries/colorbuddy.nvim",
        config = function()
            require"colorbuddy".colorscheme "gruvbuddy"
        end,
        priority = 1000
    },
}
