if not pcall(require, "telescope") then
    return
end

local nmap = require "thegoldenr.keymap".nmap

-- builtin
nmap { "<leader>pf", require("thegoldenr.telescope").find_anything }

nmap { "<leader>ps", require("thegoldenr.telescope").project_search }

-- dotfiles
nmap { "<leader>vrc", require("thegoldenr.telescope").search_nvim }
nmap { "<leader>dt", require("thegoldenr.telescope").search_dotfiles }

-- project
nmap { "<leader>nb", require("airborne.telescope").search_notebook }

-- git
nmap { "<leader>gb", require("thegoldenr.telescope").git_branches }
nmap { "<leader>gf", require("thegoldenr.telescope").git_files }
nmap { "<leader>gs",  require("thegoldenr.telescope").git_status }
--nmap { "<leader>gw", require("telescope.builtin").extension.git_worktree.git_worktree }


