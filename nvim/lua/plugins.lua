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
  local counts = vim.diagnostic.count(0)
  local parts  = {}
  if (counts[vim.diagnostic.severity.ERROR] or 0) > 0 then
    table.insert(parts, " " .. counts[vim.diagnostic.severity.ERROR])
  end
  if (counts[vim.diagnostic.severity.WARN] or 0) > 0 then
    table.insert(parts, " " .. counts[vim.diagnostic.severity.WARN])
  end
  if (counts[vim.diagnostic.severity.INFO] or 0) > 0 then
    table.insert(parts, " " .. counts[vim.diagnostic.severity.INFO])
  end
  return table.concat(parts, " ")
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

      return MiniStatusline.combine_groups({
        { hl = mode_hl,                  strings = { mode } },
        "%<",
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=",
        { hl = "MiniStatuslineDevinfo",  strings = { diagnostics } },
        { hl = "MiniStatuslineFilename", strings = { filetype } },
      })
    end,
    inactive = function()
      return MiniStatusline.combine_groups({
        { hl = "MiniStatuslineInactive", strings = { "%f" } },
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
