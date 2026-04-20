local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Space>S', 'I', opts) -- Start of Line
vim.keymap.set('n', '<Space>E', 'A', opts) -- End of Line
vim.keymap.set('n', '<Space>A', 'O', opts) -- Above
vim.keymap.set('n', '<Space>B', 'o', opts) -- Below

vim.keymap.set('n', '<Space>C', 'i', opts) -- Current
vim.keymap.set('n', '<Space>F', 'a', opts) -- Before

vim.keymap.set('n', '<Space>v', 'v', opts) -- Visual
vim.keymap.set('n', '<Space>L', 'V', opts) -- Visual Line
vim.keymap.set('n', '<Space>V', '<C-v>', opts) -- Visual Block 
