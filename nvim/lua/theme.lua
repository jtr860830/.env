require("onedarkpro").setup {
  styles = {
    comments = "italic",
    virtual_text = "italic",
  },
  plugins = {
    blink_cmp = true,
    mini_diff = true,
    mini_icons = true,
    snacks = true,
    nvim_lsp = true,
    treesitter = true,
  },
}

vim.cmd.colorscheme "onedark"

local c = require("onedarkpro.helpers").get_colors()

vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { bg = c.purple, fg = c.bg, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { bg = c.blue, fg = c.bg, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { bg = c.orange, fg = c.bg, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { bg = c.red, fg = c.bg, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { bg = c.yellow, fg = c.bg, bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { bg = c.cyan, fg = c.bg, bold = true })

vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = c.bg_statusline, fg = c.fg })
vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { bg = c.bg_statusline, fg = c.gray })

vim.api.nvim_set_hl(0, "MiniStatuslineDiagError", { bg = c.bg_statusline, fg = c.red })
vim.api.nvim_set_hl(0, "MiniStatuslineDiagWarn", { bg = c.bg_statusline, fg = c.yellow })
vim.api.nvim_set_hl(0, "MiniStatuslineDiagInfo", { bg = c.bg_statusline, fg = c.blue })
