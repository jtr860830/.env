local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Global capabilities for all servers
vim.lsp.config("*", { capabilities = capabilities })

-- Enable servers (configs provided by nvim-lspconfig's lsp/ directory)
vim.lsp.enable({
  "gopls",
  "clangd",
  "pyright",
  "ts_ls",
  "bashls",
  "yamlls",
  "taplo",
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then return end

    local bufnr = ev.buf
    local map   = function(keys, func) vim.keymap.set("n", keys, func, { buffer = bufnr }) end

    map("gd",         vim.lsp.buf.definition)
    map("gD",         vim.lsp.buf.declaration)
    map("gr",         vim.lsp.buf.references)
    map("gi",         vim.lsp.buf.implementation)
    map("K",          vim.lsp.buf.hover)
    map("<leader>rn", vim.lsp.buf.rename)
    map("<leader>ca", vim.lsp.buf.code_action)
    map("<leader>td", vim.lsp.buf.type_definition)

    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      vim.api.nvim_create_autocmd("InsertEnter", {
        buffer   = bufnr,
        callback = function() vim.lsp.inlay_hint.enable(false, { bufnr = bufnr }) end,
      })
      vim.api.nvim_create_autocmd("InsertLeave", {
        buffer   = bufnr,
        callback = function() vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end,
      })
    end
  end,
})

local diag_icons = {
  [vim.diagnostic.severity.ERROR] = vim.fn.nr2char(0xea87) .. " ",
  [vim.diagnostic.severity.WARN]  = vim.fn.nr2char(0xea6c) .. " ",
  [vim.diagnostic.severity.HINT]  = vim.fn.nr2char(0xea61) .. " ",
  [vim.diagnostic.severity.INFO]  = vim.fn.nr2char(0xea74) .. " ",
}

vim.diagnostic.config({
  virtual_text     = true,
  underline        = true,
  update_in_insert = false,
  severity_sort    = true,
  signs            = { text = diag_icons },
  float            = { border = "rounded", source = true },
})
