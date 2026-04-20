local git = require('gitsigns')

vim.keymap.set('n', 'li', git.toggle_signs, { desc = "Toggle Gitsigns" })
