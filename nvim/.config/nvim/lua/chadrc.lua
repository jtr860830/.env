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
  cmp = { lspkind_text = false },
  statusline = { theme = "vscode_colored" },
}

M.base46 = {
  integrations = {
    "lspsaga",
    "notify",
    "trouble",
    "vim-illuminate",
  },
}

return M
