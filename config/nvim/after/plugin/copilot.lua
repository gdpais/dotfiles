--[[ local keymap = require "obimel.keymap"
local nmap = keymap.nmap
local imap = keymap.imap
local suggestions = require("copilot.suggestion")

nmap { "<C-g>h", suggestions.toggle_auto_trigger }
imap { "<C-g>j", suggestions.next }
imap { "<C-g>k", suggestions.prev }
imap { "<C-g>l", suggestions.accept } ]]
