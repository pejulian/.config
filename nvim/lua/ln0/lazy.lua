local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "ln0.plugins" }, { import = "ln0.plugins.lsp" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
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
})
