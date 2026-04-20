local opts = { noremap = true, silent = true }

vim.opt.clipboard = "unnamedplus"

-- COPIAR (Copy)
vim.keymap.set({'n', 'v'}, '<C-c>', '"+y', opts)
vim.keymap.set('n', '<C-c><C-c>', '"+yy', opts)

-- PEGAR (Paste)
vim.keymap.set({'n','v'}, '<C-v>', '"+p', opts)
vim.keymap.set("x", "<C-v>", [["_dP]])
vim.keymap.set('i', '<C-v>', '<C-r>+', opts)

-- CORTAR (Cut)
vim.keymap.set({'n', 'v'}, '<C-b>', '"+d', opts)
vim.keymap.set('n', '<C-b><C-b>', '"+dd', opts)

-- BORRAR (Delete - Black Hole)
vim.keymap.set('n', '<Backspace>', '"_x', opts)      -- Carácter
vim.keymap.set({'n', 'v'}, '<C-x>', '"_d', opts)   -- Selección (Usando X Mayúscula
vim.keymap.set('n', '<C-x><C-x>', '"_dd', opts)        -- Línea completa

-- UNDO / REDO
vim.keymap.set({'n', 'v'}, '<C-z>', 'u', opts)
vim.keymap.set({'n', 'v'}, 'Z', '<C-r>', opts)  


