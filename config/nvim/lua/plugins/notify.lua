return {
    {
        "rcarriga/nvim-notify",
        lazy = false,
        config = function()
            local notify = require "notify"

            notify.setup {
                stages = "slide"
            }

            vim.notify = notify
            --vim.notify = function(msg, level, opts)
            -- execute something else before notify
            -- notify(msg, level, opts)
            --end
        end
    }
}
