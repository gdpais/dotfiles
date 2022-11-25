local ok, neogit = pcall(require, "neogit")
if not ok then
    return
end

local nmap = require("thegoldenr.keymap").nmap

neogit.setup {
  integrations = {
    -- Requires `use "sindrets/diffview.nvim"`
    diffview = true
  },
}

nmap { "<space>vv", ":DiffviewOpen<CR>" }
nmap { "<leader>gs", neogit.open }
nmap { "<leader>gc", function() neogit.open { "commit" } end }

--hi NeogitNotificationInfo guifg=#80ff95
--hi NeogitNotificationWarning guifg=#fff454
--hi NeogitNotificationError guifg=#c44323
