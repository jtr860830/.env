local M = {}

M.ui = {
  theme = "doomchad",
  theme_toggle = {
    "doomchad",
    "one_light"
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  statusline = { theme = "vscode_colored" },
}

M.base46 = {
  integrations = {
    "lspsaga",
    "notify",
    "vim-illuminate",
  },
}

return M
