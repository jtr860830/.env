require("blink.cmp").setup({
  keymap    = { preset = "default" },
  appearance = { nerd_font_variant = "mono" },
  sources   = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  signature = {
    enabled = true,
    window  = { border = "rounded" },
  },
  completion = {
    documentation = {
      auto_show = true,
      window    = { border = "rounded" },
    },
    menu = { border = "rounded" },
  },
})
