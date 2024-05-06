return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  opts = {
    debug = true, -- Enable debugging
  },
  keys = {
    {
      "<leader>ccq",
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
      "<leader>cch",
      function()
        require("CopilotChat.integrations.telescope").pick(require("CopilotChat.actions").help_actions())
      end,
      desc = "GitHub Copilot Chat - Prompt actions",
    },
    {
      "<leader>ccp",
      function()
        require("CopilotChat.integrations.telescope").pick(require("CopilotChat.actions").prompt_actions())
      end,
      desc = "GitHub Copilot Chat - Prompt actions",
    },
  },
}
