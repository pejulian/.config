return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        {
            "microsoft/vscode-js-debug",
            build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
        },
        {
            "mxsdev/nvim-dap-vscode-js",
            config = function()
                require("dap-vscode-js").setup({
                    debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
                    adapters = {
                        "chrome",
                        "pwa-node",
                        "pwa-chrome",
                        "pwa-msedge",
                        "pwa-extensionHost",
                        "node-terminal",
                        "node",
                    },
                })
            end,
        },
        {
            "Joakker/lua-json5",
            build = "./install.sh",
        },
    },
    config = function()
        local dap = require("dap")

        local languages = {
            "typescript",
            "javascript",
            "typescriptreact",
            "javascriptreact",
        }

        for _, language in ipairs(languages) do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                    sourceMaps = true,
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                    sourceMaps = true,
                },
                {
                    type = "pwa-chrome",
                    request = "launch",
                    name = "Launch & Debug in Chrome",
                    url = function()
                        local co = coroutine.running()
                        return coroutine.create(function()
                            vim.ui.input({
                                prompt = "Enter URL: ",
                                default = "http://localhost:3000",
                            }, function(url)
                                if url == nil or url == "" then
                                    return
                                else
                                    coroutine.resume(co, url)
                                end
                            end)
                        end)
                    end,
                    webRoot = "${workspaceFolder}",
                    skipFiles = { "<node_internals>/**/*.js" },
                    protocol = "inspector",
                    sourceMaps = true,
                    userDataDir = false,
                },
                {
                    name = "---- launch.json configs ----",
                    type = "",
                    request = "launch",
                },
            }
        end

        local wk = require("which-key")

        wk.add({
            {
                "<leader>d",
                group = "DAP",
            },
            {
                "<leader>dt",
                function()
                    dap.toggle_breakpoint()
                end,
                desc = "Toggle breakpoint",
                mode = { "n", "v" },
            },
            {
                "<leader>da",
                function()
                    if vim.fn.filereadable(".vscode/launch.json") then
                        local dap_vscode = require("dap.ext.vscode")
                        dap_vscode.load_launchjs(nil, {
                            ["pwa-node"] = languages,
                            ["node"] = languages,
                            ["chrome"] = languages,
                            ["pwa-chrome"] = languages,
                        })
                    end
                    require("dap").continue()
                end,
                desc = "Run with arguments",
            },
            {
                "<leader>dc",
                function()
                    dap.continue()
                end,
                desc = "Execute until next breakpoint",
                mode = { "n" },
            },
            {
                "<leader>do",
                function()
                    dap.step_over()
                end,
                desc = "Execute method as a whole and stop",
                mode = { "n" },
            },
            {
                "<leader>di",
                function()
                    dap.step_into()
                end,
                desc = "Step into method, execute first line in method, stop",
                mode = { "n" },
            },
            {
                "<leader>dx",
                function()
                    dap.step_out()
                end,
                desc = "Finish executing callee's code and stop when execution returns to the caller",
                mode = { "n" },
            },
        })
    end,
}
