--TODO: refact
local ok, dap = pcall(require, "dap")
if not ok then
    return
end

local nmap = require("obimel.keymap").nmap

-- fancy fancy <3 ty tj
vim.fn.sign_define("DapBreakpoint", { text = "ß", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ü", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "ඞ", texthl = "Error" })

require("nvim-dap-virtual-text").setup()

local dap_ui = require "dapui"
local _ = dap_ui.setup {
    layouts = {
        {
            elements = {
                "scopes",
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 10,
            position = "bottom",
        },
    },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dap_ui.open(1)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dap_ui.close()
end

--require "obimel.debugger.node"

nmap { "<F4>", function()
    dap_ui.toggle(1)
end }
nmap { "<F5>", function()
    dap_ui.toggle(2)
end }
nmap { "<Up>", dap.continue }
nmap { "<Down>", dap.step_over }
nmap { "<Right>", dap.step_into }
nmap { "<Left>", dap.step_out }
nmap { "<Leader>b", dap.toggle_breakpoint }
nmap { "<Leader>B", function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end }
