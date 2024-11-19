local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', '<leader>w', '<cmd>w<CR>', opts)
keymap('n', '<leader>q', '<cmd>q<CR>', opts)
keymap('n', '<Esc>', '<cmd>noh<CR>', opts)
keymap('n', '<leader>c', '<cmd>bd<CR>', opts)

keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

