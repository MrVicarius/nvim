vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- error diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- zig commands
vim.keymap.set("n", "<leader>zb", ":!zig build<CR>")
vim.keymap.set("n", "<leader>zr", ":!zig build run<CR>")

