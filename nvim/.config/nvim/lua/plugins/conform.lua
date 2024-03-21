local M = {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  config = function()
    require "configs.conform"
  end,
}

return M
