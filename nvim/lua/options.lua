local opt = vim.opt

opt.number         = true
opt.relativenumber = true
opt.signcolumn     = "yes"
opt.cursorline     = true
opt.scrolloff      = 8
opt.sidescrolloff  = 8

opt.tabstop     = 2
opt.shiftwidth  = 2
opt.expandtab   = true
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase  = true
opt.hlsearch   = false
opt.incsearch  = true

opt.splitbelow = true
opt.splitright = true

opt.showmode = false
opt.laststatus    = 3

opt.undofile = true
opt.swapfile = false
opt.backup   = false

opt.updatetime = 250
opt.timeoutlen = 300

opt.clipboard = "unnamedplus"

if vim.fn.executable("rg") == 1 then
  opt.grepprg    = "rg --vimgrep"
  opt.grepformat = "%f:%l:%c:%m"
end
