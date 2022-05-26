local map = vim.keymap.set

-- Leader
vim.g.mapleader = " "

-- Disabling arrows keys
-- map('', '<up>', ':echoe "Use k"<CR>', {noremap = true, silent = false})
-- map('', '<down>', ':echoe "Use j"<CR>', {noremap = true, silent = false})
-- map('', '<left>', ':echoe "Use h"<CR>', {noremap = true, silent = false})
-- map('', '<right>', ':echoe "Use l"<CR>', {noremap = true, silent = false})

-- Standard operations
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
map("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
map("n", "<C-q>", "<cmd>q!<cr>", { desc = "Force quit" })
map("n", "Q", "<Nop>")

-- Stay in indent mode
map("v", "<", "<gv", { desc = "unindent line" })
map("v", ">", ">gv", { desc = "indent line" })

-- Improved Terminal Mappings
map("t", "<esc>", "<C-\\><C-n>", { desc = "Terminal normal mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Terminal normal mode" })
map("t", "<C-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window navigation" })
map("t", "<C-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal down window navigation" })
map("t", "<C-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal up window navigation" })
map("t", "<C-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window naviation" })
