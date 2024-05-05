return {
  "nvimdev/lspsaga.nvim",
  event = { "LspAttach" },
  config = function()
    require("lspsaga").setup({})

    local wk = require("which-key")

    wk.register({
      ls = {
        name = "Lspsaga",
        c = { "<cmd>Lspsaga code action<cr>", "Code action" },
        o = { "<cmd>Lspsaga outline<cr>", "Outline" },
        r = { "<cmd>Lspsaga rename<cr>", "Rename" },
        d = { "<cmd>Lspsaga goto_definition<cr>", "LSP Goto definition" },
        f = { "<cmd>Lspsaga finder<cr>", "LSP Finder" },
        p = { "<cmd>Lspsaga preview_definition<cr>", "Preview definition" },
        s = { "<cmd>Lspsaga signature_help<cr>", "Signature help" },
        w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics" },
      },
    }, { prefix = "<leader>" })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
