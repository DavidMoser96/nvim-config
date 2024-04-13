require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.g.python_host_prog = "/home/david/.config/nvim/.venv/bin/python"
vim.g.python3_host_prog = "/home/david/.config/nvim/.venv/bin/python3"

local enable_providers = {
    "python3_provider",
    -- "node_provider",
    -- and so on
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end
