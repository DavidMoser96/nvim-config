require "nvchad.mappings"
require "mappings.NVimTree"
require "mappings.dapui"
require "mappings.molten"

-- quote shortcut current word
vim.api.nvim_set_keymap('n', '<leader>q', 'viwc"<C-r>""<Esc>', { noremap = true, silent = true})
-- unquote shortcut current word
vim.api.nvim_set_keymap('n', '<leader>u', 'di"h2x<C-r>"<Esc>', { noremap = true, silent = true})
-- quote shortcut for currently selected text
vim.api.nvim_set_keymap('v', '<leader>q', 'c"<C-r>""<Esc>', { noremap = true, silent = true})


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
