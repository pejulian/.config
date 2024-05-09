return {
  "nvimdev/lspsaga.nvim",
  event = { "LspAttach" },
  config = function()
    require("lspsaga").setup({})

    local wk = require("which-key")

    wk.register({
      l = {
        name = "+lsp",
        s = {
          name = "+saga",
          c = { "<cmd>Lspsaga code_action<cr>", "Code action" },
          h = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc" },
          o = { "<cmd>Lspsaga outline<cr>", "Outline" },
          r = { "<cmd>Lspsaga rename<cr>", "Rename" },
          d = { "<cmd>Lspsaga goto_definition<cr>", "Goto definition" },
          D = { "<cmd>Lspsaga goto_type_definition<cr>", "Goto type definition" },
          t = { "<cmd>Lspsaga term_toggle<cr>", "Terminal toggle" },
          f = { "<cmd>Lspsaga finder<cr>", "LSP Finder" },
          p = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" },
          P = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek type definition" },
          w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics" },
        },
      },
    }, { prefix = "<leader>" })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
