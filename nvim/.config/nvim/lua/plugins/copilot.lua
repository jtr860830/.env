local M = {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  opts = {
    filetypes = {
      yaml = true,
      markdown = true,
      help = true,
      gitcommit = true,
      gitrebase = true,
    },
    suggestion = {
      enable = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-CR>",
      },
    },
  },
}

return M
