local M = {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
  },
  event = "User FilePost",
  config = function()
    require "configs.lspsaga"
  end,
}

return M
