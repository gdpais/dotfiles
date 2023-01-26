-- dbui
--vim.g.db_ui_use_nerd_fonts = 1
--vim.g.db_ui_show_database_icon = 1
--vim.g.db_ui_force_echo_notifications = 1
--vim.g.db_ui_win_position = 'left'
--vim.g.db_ui_winwidth = 80
--
--vim.g.db_ui_icons = {
--    expanded = {
--        db = '▾ ',
--        buffers = '▾ ',
--        saved_queries = '▾ ',
--        schemas = '▾ ',
--        schema = '▾ פּ',
--        tables = '▾ 藺',
--        table = '▾ ',
--    },
--    collapsed = {
--        db = '▸ ',
--        buffers = '▸ ',
--        saved_queries = '▸ ',
--        schemas = '▸ ',
--        schema = '▸ פּ',
--        tables = '▸ 藺',
--        table = '▸ ',
--    },
--    saved_query = '',
--    new_query = '璘',
--    tables = '離',
--    buffers = '﬘',
--    add_connection = '',
--    connection_ok = '✓',
--    connection_error = '✕',
--}

local keymap = require('airborne.keymap')
local nmap = keymap.nmap
local vmap = keymap.vmap
-- add password
local passwd = ""
local url = "jdbc:sqlserver://localhost;encrypt=true;user=sa;password=" .. passwd .. ";integratedSecurity=true;encrypt=true;trustServerCertificate=true;"
--nmap { "<leader>db", function() vim.cmd('DBUIToggle') end }
--vmap { "<leader>db", "<cmd>'<,'>DB " .. url .. "<CR>" }
vmap { "<leader>db", ":'<,'>DB " .. url .. "<CR>" }
nmap { "<leader>db", ":%DB " .. url .. "<CR>" }
