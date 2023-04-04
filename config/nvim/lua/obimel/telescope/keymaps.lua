local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local tel_setup = require "obimel.telescope.search"
local nmap = require("obimel.keymap").nmap

nmap { "<leader>pf", tel_setup.find_anything }
nmap { "<leader>lg", tel_setup.live_grep }
nmap { "<leader>ps", tel_setup.grep_str }

-- dotfiles + projects
nmap { "<leader>vrc", tel_setup.search_nvim }
nmap { "<leader>dt", tel_setup.search_dotfiles }
nmap { "<leader>nb", tel_setup.search_notebook }
nmap { "<leader>pw", tel_setup.search_work }

-- git
nmap { "<leader>gb", tel_setup.git_branches }
nmap { "<leader>gf", tel_setup.git_files }
nmap { "<leader>gs", tel_setup.git_status }
nmap { "<leader>gc", tel_setup.git_commits }
nmap { "<leader>gw", function() telescope.extensions.git_worktree.git_worktrees() end }
