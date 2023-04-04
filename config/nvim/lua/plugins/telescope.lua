return {
    {
        "nvim-telescope/telescope.nvim",
        priority = 100,
        config = function()
            require "obimel.telescope.setup"
            require "obimel.telescope.keymaps"
        end
    },
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
        "AckslD/nvim-neoclip.lua",
        --[[requires = {
            { 'kkharji/sqlite.lua', module = 'sqlite' },
        },--]]
        config = function()
            require('neoclip').setup()
        end,
    }
}
