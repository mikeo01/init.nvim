vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Global Keybindings
vim.keymap.set("n", "<Esc><Esc>", ":noh<CR>", { noremap = true, silent = true, desc = "De-select / esc" })

-- Buffers
vim.keymap.set("n", "<leader>fs", ":wa<CR>", { noremap = true, silent = true, desc = "Save" })
vim.keymap.set("i", "<C-v>", "<C-o>p<CR>", { noremap = true, silent = true, desc = "Paste" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename" })

-- Text
vim.keymap.set("n", "<C-a>", "GVgg", { noremap = true, silent = true, desc = "Select all" })
vim.keymap.set("v", "<TAB>", ">><CR>", { noremap = true, silent = true, desc = "Indent" })
vim.keymap.set("v", "<S-TAB>", "<<<CR>", { noremap = true, silent = true, desc = "Reverse indent" })

-- Symbols
-- vim.keymap.set("n", "gd", "<C-]>", { noremap = true, silent = true })

-- Window Management
-- vim.keymap.set("n", "<S-k>", ":above split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-j>", ":below split<CR>", { noremap = true, silent = true, desc = "Split below" })
vim.keymap.set("n", "<S-h>", ":vs<CR>", { noremap = true, silent = true, desc = "Split vertically" })
vim.keymap.set("n", "<S-l>", ":botright vs<CR>", { noremap = true, silent = true, desc = "Split vertically" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move to right window" })
vim.keymap.set("n", "<C-up>", ":res -1<CR>", { noremap = true, silent = true, desc = "Resize window height (-)" })
vim.keymap.set("n", "<C-down>", ":res +1<CR>", { noremap = true, silent = true, desc = "Resize window height (+)" })
vim.keymap.set("n", "<C-right>", "<C-W>> +", { noremap = true, silent = true, desc = "Resize window width (+)" })
vim.keymap.set("n", "<C-left>", "<C-W>< -", { noremap = true, silent = true, desc = "Resize window width (-)" })
vim.keymap.set("n", "<leader>wd", ":q<CR>", { noremap = true, silent = true, desc = "Close window / buffer" })

-- Terminal
vim.keymap.set("n", "<leader>ot", ":term<CR>", { noremap = true, silent = true, desc = "Open terminal" })
vim.keymap.set("t", "<localleader>c", "<C-\\><C-n><CR>", { noremap = true, silent = true, desc = "Normal mode from terminal" })

-- Vista
vim.keymap.set("n", "<localleader>v", ":Vista<CR>", { noremap = true, silent = true, desc = "Show symbols" })
