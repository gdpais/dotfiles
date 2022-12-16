local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local my_telescope = require"obimel.telescope"
local nmap = require"obimel.keymap".nmap

nmap { "<leader>pf", my_telescope.find_anything }
nmap { "<leader>lg", my_telescope.live_grep }
nmap { "<leader>ps", my_telescope.grep_str }

-- dotfiles + projects
nmap { "<leader>vrc", my_telescope.search_nvim }
nmap { "<leader>dt", my_telescope.search_dotfiles }
nmap { "<leader>nb", my_telescope.search_notebook }
nmap { "<leader>pw", my_telescope.search_work }

-- git
nmap { "<leader>gb", my_telescope.git_branches }
nmap { "<leader>gf", my_telescope.git_files }
nmap { "<leader>gs", my_telescope.git_status }
nmap { "<leader>gc", my_telescope.git_commits }
nmap { "<leader>gw", function() telescope.extensions.git_worktree.git_worktrees() end }
