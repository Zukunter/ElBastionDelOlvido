{
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      ensure_installed = {
        "rust", "zig", "c_sharp", "c", "cpp", "sql", "nasm", 
        "bash", "lua", "markdown", "markdown_inline", "python", "javascript",
        "toml", "xml", "yaml", "css", "dockerfile", "query", "json", "ron", "make",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = false,
      },
    }, 
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        pattern = "*",
        callback = function()
          local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
          if lang then
            pcall(vim.treesitter.start)
          end
        end,
      })
    end,
  },
},
