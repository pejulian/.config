return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
        { "zbirenbaum/copilot.lua" },
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
        debug = true, -- Enable debugging
        allow_insecure = true, -- Allow insecure connections
        window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
        },
        mappings = {
            complete = {
                insert = "",
            },
        },
        chat_autocomplete = true,
    },
    keys = {
        {
            "<leader>gcq",
            function()
                vim.ui.input({
                    prompt = "Quick chat: ",
                    completion = "file",
                }, function(value, canceled)
                    if canceled then
                        return
                    else
                        require("CopilotChat").ask(value, { selection = require("CopilotChat.select").buffer })
                    end
                end)
            end,
            desc = "GitHub Copilot Chat - Quick Chat",
        },
        {
            "<leader>gch",
            function()
                local telescope = require("CopilotChat.integrations.telescope")
                local actions = require("CopilotChat.actions").help_actions()
                telescope.pick(actions)
            end,
            desc = "GitHub Copilot Chat - Help actions",
        },
        {
            "<leader>gcp",
            function()
                require("CopilotChat.integrations.telescope").pick(require("CopilotChat.actions").prompt_actions())
            end,
            desc = "GitHub Copilot Chat - Prompt actions",
        },
    },
}
