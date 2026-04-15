vim.keymap.set('n', 'ññ', 'gcc', { remap = true }) -- Normal 
vim.keymap.set('n', 'ñl', 'gcA', { remap = true }) -- End 
vim.keymap.set('n', 'ñs', 'gco', { remap = true }) -- Below
vim.keymap.set('n', 'ñw', 'gcO', { remap = true }) -- Above
vim.keymap.set('n', 'ño', 'gcip', { remap = true }) -- Whole

vim.keymap.set('v', 'ññ', 'gc', { remap = true, desc = "Selection" })
vim.keymap.set('v', 'ño', 'gb', { remap = true, desc = "Block Selection" })


