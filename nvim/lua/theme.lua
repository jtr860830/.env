require("onedarkpro").setup({
  styles = {
    comments = "italic",
  },
})

vim.cmd.colorscheme("onedark")

local c = require("onedarkpro.helpers").get_colors()
vim.api.nvim_set_hl(0, "IblIndent",            { fg = c.gray, nocombine = true })
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = c.blue, nocombine = true })
