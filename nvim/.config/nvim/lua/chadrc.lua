local M = {}

M.ui = {
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  cmp = { lspkind_text = false },
  statusline = { theme = "vscode_colored" },
}

return M
