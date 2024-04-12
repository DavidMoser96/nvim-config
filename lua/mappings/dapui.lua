local map = vim.keymap.set

map("n","<leader>db",function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP Toggle Breakpoint" })

map("n","<F5>",function()
  require("dap").continue()
end, { desc = "DAP Run/Continue Debugger" })

map("n","<F10>",function()
  require("dap").step_over()
end, { desc = "DAP Step over function" })

map("n","<F11>",function()
  require("dap").step_into()
end, { desc = "DAP Step into function" })

map("n","<F12>",function()
  require("dap").step_out()
end, { desc = "DAP Step out of function" })

map("n","<leader>du",function()
  require("dapui").toggle()
end, { desc = "DAP Toggle UI" })
