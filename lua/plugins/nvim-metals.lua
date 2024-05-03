return {
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
}
