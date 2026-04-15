vim.keymap.set({'n', 'v'}, 'W', '<PageUp>', opts)
vim.keymap.set({'n', 'v'}, 'S', '<PageDown>', opts)

vim.keymap.set({'n', 'v'}, 'w', '<Up>', opts) -- Arriba / Up
vim.keymap.set({'n', 'v'}, 's', '<Down>', opts) -- Abajo / Down
vim.keymap.set({'n', 'v'}, 'a', '<Left>', opts) -- Izquierda / Left
vim.keymap.set({'n', 'v'}, 'd', '<Right>', opts) -- Derecha / Right

vim.keymap.set({'n', 'v'}, 'A', '<Home>', opts) -- Inicio absoluto / Absolute start
vim.keymap.set({'n', 'v'}, 'D', '<End>', opts) -- Final de línea / End of line

vim.keymap.set({'n', 'v'}, 'e','w', opts)
vim.keymap.set({'n', 'v'}, 'q', 'b',opts)
vim.keymap.set({'n', 'v'}, 'E', 'W', opts)
vim.keymap.set({'n', 'v'}, 'Q', 'B', opts)

vim.keymap.set('n', 'r', 'n', opts)
vim.keymap.set('n', '\\', '*', opts)
vim.keymap.set('n', '<Tab>', 'N', opts)
vim.keymap.set('n', 'R', ':nohlsearch<CR>', { silent = true })
-- Insert Maps
vim.keymap.set('i', '<M-w>', '<Up>', opts)
vim.keymap.set('i', '<M-s>', '<Down>', opts)
vim.keymap.set('i', '<M-a>', '<Left>', opts)
vim.keymap.set('i', '<M-d>', '<Right>', opts)

vim.keymap.set('i', '<C-A>', '<Home>', opts)
vim.keymap.set('i', '<C-D>', '<End>', opts)

vim.keymap.set('i', '<M-e>', '<S-Right>', opts) -- Siguiente palabra
vim.keymap.set('i', '<M-q>', '<S-Left>', opts)  -- Palabra anterior

vim.keymap.set('i', '<C-W>', '<PageUp>', opts)
vim.keymap.set('i', '<C-S>', '<PageDown>', opts)
