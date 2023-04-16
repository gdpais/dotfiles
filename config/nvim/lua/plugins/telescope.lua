return {
    {
        "nvim-telescope/telescope.nvim",
        priority = 100,
        config = function()
            require "obimel.telescope.setup"
            require "obimel.telescope.keymap"
        end
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "dhruvmanila/browser-bookmarks.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
        "AckslD/nvim-neoclip.lua",
        --[[requires = {
            { 'kkharji/sqlite.lua', module = 'sqlite' },
        },--]]
        config = function()
            require('neoclip').setup()
        end,
    },
}
