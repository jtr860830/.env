local fzf = require("fzf-lua")

fzf.setup({
  winopts = {
    height  = 0.85,
    width   = 0.80,
    preview = {
      layout      = "flex",
      flip_columns = 120,
    },
  },
})

local map = vim.keymap.set
map("n", "<leader>ff", fzf.files)
map("n", "<leader>fg", fzf.live_grep)
map("n", "<leader>fb", fzf.buffers)
map("n", "<leader>fh", fzf.help_tags)
map("n", "<leader>fr", fzf.oldfiles)
map("n", "<leader>fs", fzf.lsp_document_symbols)
map("n", "<leader>fw", fzf.grep_cword)
map("n", "<leader>fd", fzf.diagnostics_document)
