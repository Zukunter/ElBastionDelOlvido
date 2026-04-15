return {
  "echasnovski/mini.pairs",
  version = false,
  config = function()
    require("mini.pairs").setup({
      -- Modos en los que se desactiva / Modi, in denen es deaktiviert ist
      modes = { insert = true, command = true, terminal = true },
      
      -- Opciones globales / Globale Optionen
      mappings = {
        ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
	['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
	       
        [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
        [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
        ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
	['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
        
        ['"'] = { action = 'open', pair = '""', neigh_pattern = '[^\\].' },
        ["'"] = { action = 'open', pair = "''", neigh_pattern = '[^\\].' },
        ['`'] = { action = 'open', pair = '``', neigh_pattern = '[^\\].' },

        --['"'] = { action = 'close', pair = '""', neigh_pattern = '[^\\].' },
        --["'"] = { action = 'close', pair = "''", neigh_pattern = '[^\\].' },
        --['`'] = { action = 'close', pair = '``', neigh_pattern = '[^\\].' },
      },
    })
  end,
}
