---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to text object, similar to targets.vim
          lookahead = true,
          keymaps = {
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment (va=)" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assingment (vi=)" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment (vl=)" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment (vr=)" },

            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

            ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
            ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

            ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function defintion" },
            ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definiton" },

            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>na"] = "@parameter.inner", -- swap parameters/arguments with next
            ["<leader>nm"] = "@function.outer", -- swap function with next
          },
          swap_previous = {
            ["<leader>pa"] = "@parameter.inner",
            ["<leader>pm"] = "@function.outer",
          },
        },
      },
    })
  end,
}
