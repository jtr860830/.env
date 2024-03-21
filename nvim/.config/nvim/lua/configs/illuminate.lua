dofile(vim.g.base46_cache .. "vim-illuminate")

local opts = {
  filetypes_denylist = {
    "lazy",
    "mason",
    "DressingInput",
    "DressingSelect",
    "DiffviewFiles",
    "NvimTree",
    "Trouble",
    "TelescopePrompt",
  },
}
require("illuminate").configure(opts)
