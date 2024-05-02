return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- python
        "pyright",
        -- xml
        "lemminx",
      }
    },
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "j-hui/fidget.nvim",
      "mfussenegger/nvim-dap",
    },
    ft = { "scala", "sbt", "java" },
    opts = function ()
      local metals_config = require("metals").bare_config()

      metals_config.settings = {
        serverVersion = "latest.snapshot",
      }
      
      metals_config.init_options.statusBarProvider = "off"
      metals_config.autoImportBuild = "all"
      metals_config.defaultBspToBuildTool = true
      metals_config.showImplicitArguments = true
      metals_config.showImplicitConversionsAndClasses = true
      metals_config.showInferredType = true
      metals_config.superMethodLensesEnabled = true

      metals_config.on_attach = function(client, bufnr)
        print("taco")
--        require("dap").adapters.scala = ""
        require("metals").setup_dap()
      end

      return metals_config
    end,
    config = function (self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function ()
      require("fidget").setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "theHamsta/nvim-dap-virtual-text"},
    config = function ()
      local dap = require("dap")

      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
          runType = "runOrTestFile",
          --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }
    end,
    lazy = false
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
    build = ":UpdateRemotePlugins",
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
    "tpope/vim-fugitive",
    build = ":UpdateRemotePlugins",
    lazy = false
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
  },
  require("lua.plugins.dadbod"),
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
