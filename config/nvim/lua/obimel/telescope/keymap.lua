local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local tel_search = require "obimel.telescope.search"
local tel_builtin = require "telescope.builtin"
local nmap = require("obimel.keymap").nmap

-- nmap { "", tel_builtin.keymaps }
--nmap { "", tel_builtin.builtin }
nmap { "<leader>sh", tel_builtin.help_tags }
nmap { "<leader>pd", tel_builtin.diagnostics }

--nmap { "<leader>buffer", tel_builtin.buffers }
nmap { "<leader>?", tel_search.oldfiles, { desc = "[?] Find recently opened files" } }
nmap { "<leader>/", tel_search.currbuf }
nmap { "<leader>lg", tel_search.live_grep }
nmap { "<leader>ps", tel_search.grep_str }
nmap { "<leader>pf", tel_search.find_anything }

-- dotfiles + projects
nmap { "<leader>vrc", tel_search.search_nvim }
nmap { "<leader>vb", tel_search.nvim_source }
--nmap { "<leader>dt", tel_search.search_dotfiles }
--nmap { "<leader>nb", tel_search.search_notebook }
--nmap { "<leader>pw", tel_search.search_work }

-- Git
nmap { "<leader>gb", tel_search.git_branches }
nmap { "<leader>gf", tel_search.git_files }
nmap { "<leader>gs", tel_search.git_status }
nmap { "<leader>gc", tel_search.git_commits }
nmap { "<leader>gw", function() telescope.extensions.git_worktree.git_worktrees() end }

-- Browser bookmarks
nmap { "<leader>pb", tel_search.bookmarks }
