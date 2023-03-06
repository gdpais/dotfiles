--local ok, neogit = pcall(require, "neogit")
--if not ok then
--    return
--end

local nmap = require("obimel.keymap").nmap

require("diffview").setup {
    use_icons = false,
}

nmap { "<space>vv", "<cmd>DiffviewOpen<CR>" }
nmap { "<leader>ga", "<cmd>Git add . <bar> Git commit<CR>" }
nmap { "<leader>gp", "<cmd>Git push<CR>" }

--neogit.setup {
--  integrations = {
--    -- Requires `use "sindrets/diffview.nvim"`
--    diffview = true
--  },
--}

--nmap { "<leader>ng", neogit.open }
--nmap { "<leader>ngc", function() neogit.open { "commit" } end }

--hi NeogitNotificationInfo guifg=#80ff95
--hi NeogitNotificationWarning guifg=#fff454
--hi NeogitNotificationError guifg=#c44323
