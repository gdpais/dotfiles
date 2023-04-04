local M = {}

--local themes = require "telescope.themes"

function M.reload_modules()
    -- stolen from prime/Tj <3
    local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
    for _, dir in ipairs(lua_dirs) do
        dir = string.gsub(dir, "./lua/", "")
        require("plenary.reload").reload_module(dir)
    end
end

M.find_anything = function()
    require("telescope.builtin").find_files({
        hidden = true,
    })
end

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< dotfiles >",
        cwd = "~/.config/",
        hidden = true,
    })
end

M.search_nvim = function()
    require("telescope.builtin").find_files({
        prompt_title = "< neovim_cfg >",
        cwd = "~/.config/nvim",
        hidden = true,
    })
end

M.search_notebook = function()
    require("telescope.builtin").find_files({
        prompt_title = "< MyNotebook >",
        cwd = "~/personal/mynotebook",
        hidden = true,
    })
end

M.search_work = function()
    require("telescope.builtin").find_files({
        prompt_title = "< Work >",
        cwd = "~/work",
        previewer = false,
    })
end

M.live_grep = function()
    require("telescope.builtin").live_grep {
        previewer = false,
    }
end

M.grep_str = function()
    require("telescope.builtin").grep_string {
        --previewer = false,
        hide = true,
        shorten_path = false,
    }
end

-- git stuff
M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<C-d>", actions.git_delete_branch)
            map("n", "<C-d>", actions.git_delete_branch)
            return true
        end,
    })
end

M.git_files = function()
    require("telescope.builtin").git_files()
end

M.git_status = function()
    require("telescope.builtin").git_status({
        shorten_path = false,
    })
end

M.git_commits = function()
    require("telescope.builtin").git_commits {
        winblend = 5,
    }
end

-- Not used ATM
--M.lsp_references = function()
--    require("telescope.builtin").lsp_references {
--        layout_strategy = "vertical",
--        layout_config = {
--            prompt_position = "top",
--        },
--        sorting_strategy = "ascending",
--        ignore_filename = false,
--    }
--end
--
--M.lsp_implementations = function()
--    require("telescope.builtin").lsp_implementations {
--        layout_strategy = "vertical",
--        layout_config = {
--            prompt_position = "top",
--        },
--        sorting_strategy = "ascending",
--        ignore_filename = false,
--    }
--end

return M
