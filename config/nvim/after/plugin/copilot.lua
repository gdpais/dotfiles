local ok, copilot = pcall(require, "copilot")
if not ok then
    return
end

copilot.setup({
    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
    },
    filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
            ["."] = false,
    },
    copilot_node_command = 'node', -- Node.js version must be > 16.x
    server_opts_overrides = {},
})

local keymap = require "obimel.keymap"
local nmap = keymap.nmap
local imap = keymap.imap
local suggestions = require("copilot.suggestion")

nmap { "<C-g>h", suggestions.toggle_auto_trigger }
imap { "<C-g>j", suggestions.next }
imap { "<C-g>k", suggestions.prev }
imap { "<C-g>l", suggestions.accept }
