{
  "Zukunftsdeuter/Rosse",
 lazy = false,
 priority = 1000,
  config = function()
    require("Rosse").setup({
      transparent_mode = true,
    })
    vim.cmd([[colorscheme rosse]])
  end,
},
