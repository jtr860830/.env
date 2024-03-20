local M = {
  "RRethy/vim-illuminate",
  event = "User FilePost",
  config = function ()
    require "configs.illuminate"
  end
}

return M
