{
	{   "nvim-treesitter/nvim-treesitter-textobjects"  },
	{
    "nvim-mini/mini.ai",
    opts = function(_, opts)
      local ai = require("mini.ai")


      -- Definición de objetos
      opts.custom_textobjects = {
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        w = ai.gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" }),
        s = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
        t = ai.gen_spec.treesitter({ a = "@type.outer", i = "@type.inner" }),
        i = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),
        a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
        g = ai.gen_spec.treesitter({ a = "@block.outer", i = "@block.inner" }),
        b = ai.gen_spec.treesitter({ a = "@assignment.outer", i = "@assignment.inner", lhs = "@assignment.lhs", rhs = "@assignment.rhs" }),
        r = ai.gen_spec.treesitter({ a = "@return.outer", i = "@return.inner" }),
        z = ai.gen_spec.treesitter({ a = "@attribute.outer", i = "@attribute.inner" }),
        c = ai.gen_spec.treesitter({ a = "@comment.outer" , i = "@comment.inner"}),
        l = ai.gen_spec.treesitter({ a = "@call.outer", i = "@call.inner" }),
      }

      opts.n_lines = 500
      opts.search_method = "cover_or_nearest"

      -- Mappings
      opts.mappings = {
        goto_next = "nex",
        goto_prev = "prv",
        around_next = "arnex",
        inside_next = "innex",
        around_last = "arprv",
        inside_last = "inprv",
      }

      return opts
    end,
  },
},
