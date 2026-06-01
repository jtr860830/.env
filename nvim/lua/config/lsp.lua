local lspconfig    = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

local on_attach = function(client, bufnr)
  local map = function(keys, func)
    vim.keymap.set("n", keys, func, { buffer = bufnr })
  end

  map("gd",         vim.lsp.buf.definition)
  map("gD",         vim.lsp.buf.declaration)
  map("gr",         vim.lsp.buf.references)
  map("gi",         vim.lsp.buf.implementation)
  map("K",          vim.lsp.buf.hover)
  map("<leader>rn", vim.lsp.buf.rename)
  map("<leader>ca", vim.lsp.buf.code_action)
  map("<leader>td", vim.lsp.buf.type_definition)

  if client.supports_method("textDocument/inlayHint") then
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
end

local servers = {
  gopls   = {},
  clangd  = {},
  pyright = {},
  ts_ls   = {},
  bashls  = {},
  yamlls  = {},
  taplo   = {},
}

for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach    = on_attach,
  }, config))
end

vim.diagnostic.config({
  virtual_text     = true,
  underline        = true,
  update_in_insert = false,
  severity_sort    = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.HINT]  = "󰠠 ",
      [vim.diagnostic.severity.INFO]  = " ",
    },
  },
  float = { border = "rounded", source = true },
})
