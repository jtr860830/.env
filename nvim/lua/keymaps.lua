local map = vim.keymap.set

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search" })

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

map("n", "[d", function() vim.diagnostic.jump { count = -1 } end, { desc = "Previous diagnostic" })
map("n", "]d", function() vim.diagnostic.jump { count = 1 } end, { desc = "Next diagnostic" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Diagnostic float" })
map("n", "<leader>cf", function() require("conform").format { lsp_format = "fallback" } end, { desc = "Format" })
