---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "onedark",
      status = {
        colors = {
          bg = "#2e323b",
          section_bg = "#2e323b",
          tabline_bg = "#2e323b",
          tabline_fg = "#2e323b",
          buffer_bg = "#2e323b",
          buffer_overflow_bg = "#2e323b",
          tab_close_bg = "#2e323b",
        },
        separators = {
          breadcrumbs = "   ",
        },
      },
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    opts = {
      highlights = {
        Comment = {
          italic = true,
          extend = true,
        },
      },
    },
  },
}
