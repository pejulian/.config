return {
  "nvimdev/lspsaga.nvim",
  event = { "LspAttach" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lspsaga").setup({})

    local wk = require("which-key")

    wk.add({
      { "<leader>l", group = "lsp" },
      { "<leader>ls", group = "saga" },
      { "<leader>lsD", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Goto type definition" },
      { "<leader>lsP", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek type definition" },
      { "<leader>lsc", "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
      { "<leader>lsd", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto definition" },
      { "<leader>lsf", "<cmd>Lspsaga finder<cr>", desc = "LSP Finder" },
      { "<leader>lsh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
      { "<leader>lso", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
      { "<leader>lsp", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
      { "<leader>lsr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
      { "<leader>lst", "<cmd>Lspsaga term_toggle<cr>", desc = "Terminal toggle" },
      { "<leader>lsw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Show Workspace Diagnostics" },
    })
  end,
}
