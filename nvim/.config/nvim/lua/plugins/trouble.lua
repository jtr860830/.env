local M = {
  "folke/trouble.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-tree/nvim-web-devicons"
  },
  event = "User FilePost",
  config = function ()
    require "configs.trouble"
  end
}

return M
