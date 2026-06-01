-- Git markers
require("gitsigns").setup({
  signs = {
    add          = { text = "│" },
    change       = { text = "│" },
    delete       = { text = "_" },
    topdelete    = { text = "‾" },
    changedelete = { text = "~" },
    untracked    = { text = "┆" },
  },
})

-- Autopairs
require("nvim-autopairs").setup({ check_ts = true })

-- Surround
require("mini.surround").setup()

-- Comment
require("mini.comment").setup()

-- Statusline
require("mini.statusline").setup({ use_icons = true })

-- Indent scope (active scope highlight)
require("mini.indentscope").setup({
  symbol  = "│",
  options = { try_as_border = true },
})

-- Indent lines (static)
require("ibl").setup({
  indent = { char = "│" },
  scope  = { enabled = false },
})

-- Hover highlight
require("illuminate").configure({
  delay             = 200,
  large_file_cutoff = 2000,
})

-- Breadcrumb
require("dropbar").setup()

-- Auto-format
require("conform").setup({
  formatters_by_ft = {
    go               = { "gofmt" },
    rust             = { "rustfmt" },
    javascript       = { "prettierd" },
    typescript       = { "prettierd" },
    javascriptreact  = { "prettierd" },
    typescriptreact  = { "prettierd" },
    json             = { "prettierd" },
    python           = { "ruff_format" },
    c                = { "clang_format" },
    sh               = { "shfmt" },
    bash             = { "shfmt" },
    yaml             = { "prettierd" },
    toml             = { "taplo" },
    lua              = { "stylua" },
  },
  format_on_save = {
    timeout_ms   = 500,
    lsp_fallback = true,
  },
})
