vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Global Keybindings
vim.keymap.set("n", "<Esc><Esc>", ":noh<CR>", { noremap = true, silent = true })

-- Buffers
vim.keymap.set("n", "<leader>fs", ":wa<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-v>", "<C-o>p<CR>", { noremap = true, silent = true })

-- Text
vim.keymap.set("n", "<C-a>", "Gvgg", { noremap = true, silent = true })
vim.keymap.set("v", "<TAB>", ">><CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<S-TAB>", "<<<CR>", { noremap = true, silent = true })

-- Window Management
-- vim.keymap.set("n", "<S-k>", ":above split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-j>", ":below split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", ":vs<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", ":botright vs<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-up>", ":res -1", { noremap = true, silent = true })
vim.keymap.set("n", "<C-down>", ":res +1", { noremap = true, silent = true })
vim.keymap.set("n", "<C-down>", ":res +1", { noremap = true, silent = true })
vim.keymap.set("n", "<C-right>", "<C-W>> +", { noremap = true, silent = true })
vim.keymap.set("n", "<C-left>", "<C-W>< -", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wd", ":q<CR>", { noremap = true, silent = true })

-- Terminal
vim.keymap.set("n", "<leader>ot", ":term<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<localleader>c", "<C-\\><C-n><CR>", { noremap = true, silent = true })
