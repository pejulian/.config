return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "antosha417/nvim-lsp-file-operations",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-tree.lua",
            },
            config = function()
                require("lsp-file-operations").setup()
            end,
        },
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },
        { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    },
    config = function()
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
                    { "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
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

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
    end,
}
