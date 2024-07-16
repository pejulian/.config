return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions

        local function on_list(options)
          vim.fn.setqflist({}, " ", {
            title = options.title,
            items = options.items,
            context = options.context,
          })

          vim.api.nvim_command("cfirst")
        end

        local wk = require("which-key")

        wk.add({
          { "K", vim.lsp.buf.hover, desc = "Show documentation for what is under cursor" },
          { "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
          { "]d", vim.lsp.buf.goto_next, desc = "Go to next diagnostic" },
          { "g", group = "LSP" },
          {
            "gD",
            function()
              vim.lsp.buf.declaration({ on_list = on_list })
            end,
            desc = "Go to declaration",
          },
          { "gR", "<cmd>Telescope lsp_references<CR>", desc = "Show LSP references" },
          { "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Show LSP definitions" },
          { "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Show LSP implementations" },
          { "gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show LSP type definitions" },
        }, {
          buffer = ev.buf,
        })

        wk.add({
          { "<leader>l", group = "lsp" },
          { "<leader>lc", group = "config" },
          {
            "<leader>lcD",
            "<cmd>Telescope diagnostics bufnr=0<CR>",
            desc = "Show buffer diagnostics",
          },
          { "<leader>lca", vim.lsp.buf.code_action, desc = "See available code actions" },
          { "<leader>lcd", vim.diagnostic.open_float, desc = "Show line diagnostics" },
          { "<leader>lcr", vim.lsp.buf.rename, desc = "Smart rename" },
          { "<leader>lcs", ":LspRestart<CR>", desc = "Restart LSP" },
        }, {
          mode = { "n", "v" },
          buffer = ev.buf,
        })
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
