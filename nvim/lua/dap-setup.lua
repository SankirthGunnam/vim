-- nvim-dap + UI + Python + GDB (OpenOCD/STM32-friendly). Requires GDB 14+ with --interpreter=dap.

local dap = require("dap")
local dapui = require("dapui")

local gdb_exe = vim.fn.executable("gdb-multiarch") == 1 and "gdb-multiarch" or "gdb"

dap.adapters.gdb = {
  type = "executable",
  command = gdb_exe,
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.c = {
  {
    name = "Launch (local)",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    args = {},
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Attach: gdbserver :1234",
    type = "gdb",
    request = "attach",
    target = "localhost:1234",
    program = function()
      return vim.fn.input("Path to executable (with symbols): ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
  },
  {
    name = "Attach: OpenOCD (STM32, :3333)",
    type = "gdb",
    request = "attach",
    target = "localhost:3333",
    program = function()
      return vim.fn.input("Path to firmware ELF: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.cpp = dap.configurations.c

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", circular = "" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
})

require("nvim-dap-virtual-text").setup({})

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Python: prefers debugpy via `python3 -m debugpy` when installed (--user or venv)
require("dap-python").setup("python3")

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Debug keymaps (leader = comma)
map("n", "<leader>dc", dap.continue, "DAP: Continue / start")
map("n", "<leader>dC", dap.run_last, "DAP: Run last")
map("n", "<leader>db", dap.toggle_breakpoint, "DAP: Toggle breakpoint")
map("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, "DAP: Conditional breakpoint")
map("n", "<leader>dl", dap.clear_breakpoints, "DAP: Clear breakpoints")
map("n", "<leader>dj", dap.step_over, "DAP: Step over")
map("n", "<leader>di", dap.step_into, "DAP: Step into")
map("n", "<leader>do", dap.step_out, "DAP: Step out")
map("n", "<leader>dr", dap.restart, "DAP: Restart")
map("n", "<leader>dq", dap.terminate, "DAP: Terminate")
map("n", "<leader>du", dapui.toggle, "DAP: Toggle UI")
map("n", "<leader>dh", require("dap.ui.widgets").hover, "DAP: Hover widgets")
map({ "n", "v" }, "<leader>de", dapui.eval, "DAP: Eval expression")
