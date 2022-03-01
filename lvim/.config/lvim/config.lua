-- general
vim.opt.expandtab = false

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
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

-- linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    exe = "eslint",
    filetypes = { "javascript" }
  }
})

-- formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    exe = "eslint",
    filetypes = { "javascript" }
  }
})

-- additional plugin
lvim.plugins = {
  { "editorconfig/editorconfig-vim" },
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
