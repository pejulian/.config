return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    local wk = require("which-key")
    wk.register({
      m = {
        name = "Code style",
        p = {
          function()
            conform.format({
              lsp_fallback = true,
              async = false,
              timeout_ms = 1000,
            })
          end,
          "Format file or range (in visual mode)",
        },
      },
    }, {
      prefix = "<leader>",
      mode = "n",
    })
  end,
}
