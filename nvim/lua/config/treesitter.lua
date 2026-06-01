-- nvim-treesitter 0.10+ delegates highlighting to neovim's built-in treesitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
