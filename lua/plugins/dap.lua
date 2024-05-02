return {
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
}
