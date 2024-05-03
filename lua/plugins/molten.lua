return {
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
}
