local configs = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local servers = {
  biome = {},
  clangd = {
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  },
  denols = {
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  },
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {
    root_dir = lspconfig.util.root_pattern "package.json",
    single_file_support = false,
  },
}

for name, config in pairs(servers) do
  config.on_init = on_init
  config.on_attach = on_attach
  config.capabilities = capabilities
  lspconfig[name].setup(config)
end
