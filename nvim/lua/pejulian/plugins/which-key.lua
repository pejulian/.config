return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")

    wk.register({
      s = {
        name = "Splits",
        v = { "<C-w>v", "Split window vertically" },
        h = { "<C-w>s", "Split window horizontally" },
        e = { "<C-w>=", "Make splits equal size" },
        x = { "<cmd>close<CR>", "Close current split" },
      },
      t = {
        name = "Tabs",
        o = { "<cmd>tabnew<CR>", "Open new tab" },
        x = { "<cmd>tabclose<CR>", "Close current tab" },
        n = { "<cmd>tabn<CR>", "Go to next tab" },
        p = { "<cmd>tabp<CR>", "Go to previous tab" },
        f = { "<cmd>tabnew %<CR>", "Open current buffer in new tab" },
      },
    }, {
      prefix = "<leader>",
    })
  end,
  opts = {},
}
