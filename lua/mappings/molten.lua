
local map = vim.keymap.set

map("n","<leader>mi", ":MoltenInit<CR>", { desc = "Molten Initiate kernel" })
map("n","<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "Molten Evaluate Line" })
map("n","<leader>mI", ":MoltenInterrupt<CR>", { desc = "Molten Interrupt Kernel" })
map("n","<leader>mr", ":MoltenRestart<CR>", { desc = "Molten Restart Kernel" })

map("v","<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>", { desc = "Molten Evaluate Selected Code" })
