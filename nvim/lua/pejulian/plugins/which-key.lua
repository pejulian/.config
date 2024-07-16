return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")

    wk.add({
      { "<leader>g", group = "git" },
      { "<leader>gc", group = "copilot" },
      { "<leader>gi", group = "git" },
      { "<leader>s", group = "splits" },
      { "<leader>se", "<C-w>=", desc = "Make splits equal size" },
      { "<leader>sh", "<C-w>s", desc = "Split window horizontally" },
      { "<leader>sv", "<C-w>v", desc = "Split window vertically" },
      { "<leader>sx", "<cmd>close<CR>", desc = "Close current split" },
      { "<leader>t", group = "tabs" },
      { "<leader>tf", "<cmd>tabnew %<CR>", desc = "Open current buffer in new tab" },
      { "<leader>tn", "<cmd>tabn<CR>", desc = "Go to next tab" },
      { "<leader>to", "<cmd>tabnew<CR>", desc = "Open new tab" },
      { "<leader>tp", "<cmd>tabp<CR>", desc = "Go to previous tab" },
      { "<leader>tx", "<cmd>tabclose<CR>", desc = "Close current tab" },
      { "<leader>x", group = "trouble" },
    })
  end,
  opts = {},
}
