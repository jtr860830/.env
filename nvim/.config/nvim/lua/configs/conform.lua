local opts = {
  lsp_fallback = true,

  formatters_by_ft = {
    c = { "clang-format" },
    go = { "gofmt", "goimports" },
    javascript = { "biome" },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { "black" },
    rust = { "rustfmt" },
    typescript = { "prettier" },
  },
}

require("conform").setup(opts)
