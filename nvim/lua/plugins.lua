-- Git markers
require("gitsigns").setup({
  signs = {
    add          = { text = "▏" },
    change       = { text = "▏" },
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

local function statusline_diagnostics()
  local counts    = vim.diagnostic.count(0)
  local cfg       = vim.diagnostic.config() or {}
  local sign_text = type(cfg.signs) == "table" and cfg.signs.text or {}
  local sev       = vim.diagnostic.severity
  local hl_map    = {
    [sev.ERROR] = "MiniStatuslineDiagError",
    [sev.WARN]  = "MiniStatuslineDiagWarn",
    [sev.INFO]  = "MiniStatuslineDiagInfo",
  }
  local groups = {}
  for _, s in ipairs({ sev.ERROR, sev.WARN, sev.INFO }) do
    local count = counts[s] or 0
    if count > 0 then
      local icon = vim.trim(sign_text[s] or "")
      table.insert(groups, {
        hl      = hl_map[s],
        strings = { (icon ~= "" and icon .. " " or "") .. count },
      })
    end
  end
  return groups
end

local function statusline_filename()
  local path = vim.fn.expand("%:p")
  if path == "" then return "[No Name]" end
  local root = vim.fs.root(0, { ".git", ".hg", "package.json", "Makefile" })
  local display = root and path:sub(#root + 2) or vim.fn.expand("%:~:.")
  return display .. (vim.bo.modified and " [+]" or "")
end

-- Statusline
require("mini.statusline").setup({
  use_icons = true,
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 9999 })
      local filename      = statusline_filename()
      local diagnostics   = statusline_diagnostics()

      local ft    = vim.bo.filetype
      local ok, icon = pcall(function() return require("mini.icons").get("filetype", ft) end)
      local filetype  = ft ~= "" and ((ok and icon .. " " or "") .. ft) or ""

      local groups = {
        { hl = mode_hl,                  strings = { mode } },
        "%<",
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=",
      }
      for _, g in ipairs(diagnostics) do
        table.insert(groups, g)
      end
      table.insert(groups, { hl = "MiniStatuslineFilename", strings = { filetype } })
      return MiniStatusline.combine_groups(groups)
    end,
    inactive = function()
      return MiniStatusline.combine_groups({
        { hl = "MiniStatuslineInactive", strings = { statusline_filename() } },
      })
    end,
  },
})

-- Indent scope (active scope highlight)
require("mini.indentscope").setup({
  symbol  = "▏",
  options = { try_as_border = true },
})

-- Indent lines (static)
require("ibl").setup({
  indent = { char = "▏" },
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
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
