return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment (va=)" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assingment (vi=)" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment (vl=)" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment (vr=)" },
          },
        },
      },
    })
  end,
}
