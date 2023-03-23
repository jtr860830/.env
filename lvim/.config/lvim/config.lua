-- Vim
---- general

-- LunarVim
---- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.leader = "space"

---- builtin
lvim.builtin.alpha.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "go",
  "java",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

---- additional plugins
lvim.plugins = {
  { "olimorris/onedarkpro.nvim" },
  { "gpanders/editorconfig.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach()
    end
  },
  {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    event = "InsertEnter",
  }
}

---- theme
local theme = require("onedarkpro")
theme.setup({
  styles = {
    comments = "italic"
  },
  options = {
    bold = true,
    italic = true,
    cursorline = true,
    highlight_inactive_windows = true
  }
})
lvim.builtin.lualine.options.theme = "onedark"
lvim.colorscheme = "onedark"

---- linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    exe = "eslint",
    filetypes = { "javascript" }
  }
})

---- formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    exe = "eslint",
    filetypes = { "javascript" }
  },
  {
    exe = "black",
    filetypes = { "python" }
  }
})
