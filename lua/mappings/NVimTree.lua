-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n","<C-n>")

map("n", "<leader>n","<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })


