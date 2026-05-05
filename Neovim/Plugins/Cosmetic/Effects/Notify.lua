-- Mit lazy.nvim installieren / Install with lazy.nvim
{
  "rcarriga/nvim-notify",
  opts = {
    timeout = 3000, -- Verschwindet nach 3 Sekunden / Disappears after 3s 
    render = "minimal", -- Passt zu deinem minimalistischen Stil / Fits your minimalist style
    stages = "fade", -- Sanfter Übergang / Smooth transition
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify
  end,
},
