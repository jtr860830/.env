require("onedarkpro").setup({
  styles = {
    comments     = "italic",
    virtual_text = "italic",
  },
  plugins = {
    gitsigns         = true,
    indentline       = true,
    mini_indentscope = true,
  },
})

vim.cmd.colorscheme("onedark")

local c = require("onedarkpro.helpers").get_colors()

-- Indent guides
vim.api.nvim_set_hl(0, "IblIndent",            { fg = c.gray,   nocombine = true })
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = c.blue,   nocombine = true })

-- Statusline mode colors (matching tmux)
vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal",  { bg = c.purple, fg = c.bg,  bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert",  { bg = c.blue,   fg = c.bg,  bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual",  { bg = c.orange, fg = c.bg,  bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { bg = c.red,    fg = c.bg,  bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { bg = c.yellow, fg = c.bg,  bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeOther",   { bg = c.cyan,   fg = c.bg,  bold = true })

-- Statusline base (slightly elevated surface, like tmux status bar)
vim.api.nvim_set_hl(0, "MiniStatuslineFilename",  { bg = c.bg_statusline, fg = c.fg })
vim.api.nvim_set_hl(0, "MiniStatuslineInactive",  { bg = c.bg_statusline, fg = c.gray })

-- Statusline diagnostics (per-severity colors)
vim.api.nvim_set_hl(0, "MiniStatuslineDiagError", { bg = c.bg_statusline, fg = c.red })
vim.api.nvim_set_hl(0, "MiniStatuslineDiagWarn",  { bg = c.bg_statusline, fg = c.yellow })
vim.api.nvim_set_hl(0, "MiniStatuslineDiagInfo",  { bg = c.bg_statusline, fg = c.blue })
