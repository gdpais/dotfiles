if not pcall(require, "telescope") then
    return
end

local nmap = require "thegoldenr.keymap".nmap

nmap { "<leader>pf", require("thegoldenr.telescope").find_anything }
nmap { "<leader>lg", require("thegoldenr.telescope").live_grep }

-- dotfiles + projects
nmap { "<leader>vrc", require("thegoldenr.telescope").search_nvim }
nmap { "<leader>dt", require("thegoldenr.telescope").search_dotfiles }
nmap { "<leader>nb", require("thegoldenr.telescope").search_notebook }

-- git
nmap { "<leader>gb", require("thegoldenr.telescope").git_branches }
nmap { "<leader>gf", require("thegoldenr.telescope").git_files }
nmap { "<leader>gs",  require("thegoldenr.telescope").git_status }
--nmap { "<leader>gw", require("telescope.builtin").extension.git_worktree.git_worktree }
