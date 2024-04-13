return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = { "theHamsta/nvim-dap-virtual-text"}
  },
  {
    "nvim-neeotest/nvim-nio",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      require('dapui').setup()
      require('configs.dapui')
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require('nvim-dap-virtual-text').setup()
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies =  {"mfussenegger/nvim-dap","rcarriga/nvim-dap-ui"},
    config = function()
      require('dap-python').setup('~/.config/nvim/.venv/bin/python')
    end,
    ft = {"python"}
  },

  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      require('image').setup({
        backend = "kitty",
        --integrations = {},
        max_width = 100,
        max_height = 22,
        max_width_window_percentage = math.huge,
        max_height_window_percentage = math.huge,
        window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      })
    end,
    lazy = false
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    opts = {
      rocks = { "magick" } -- Specify LuaRocks packages to install
    },
    -- lazy = false,
  },
  {
    "benlubas/molten-nvim",
    dependencies = { "3rd/image.nvim"},
    build = ":UpdateRemotePlugins",
    init = function ()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_use_border_highlights = true
    end,
    ft = {"python"}
  }

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
