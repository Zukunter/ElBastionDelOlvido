{
  "Zukunftsdeuter/rosse.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("rosse").setup({
      transparent_mode = true, -- Activa el modo transparente
    })
    vim.cmd([[colorscheme rosse]])
  end,
},
