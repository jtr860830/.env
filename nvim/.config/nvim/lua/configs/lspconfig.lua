local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local servers = {
  clangd = {},
  gopls = {},
  jsonls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
}

for name, config in pairs(servers) do
  config.on_init = on_init
  config.on_attach = on_attach
  config.capabilities = capabilities
  require("lspconfig")[name].setup(config)
end
