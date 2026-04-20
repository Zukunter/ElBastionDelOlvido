return {
  "sustech-data/wildfire.nvim",
  event = "VeryLazy",
	lazy = true,
 dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("wildfire").setup({
      keymaps = {
        init_selection = "<Cr>",
        node_incremental = "<Cr>",
        node_decremental = "<BackSpace>",
      },
    })
  end,
}
