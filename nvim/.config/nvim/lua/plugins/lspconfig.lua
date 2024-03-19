local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "ray-x/lsp_signature.nvim",
    "nvimdev/lspsaga.nvim",
  },
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require "configs.lspconfig"
    require("lspsaga").setup()
  end,
}

return M
