return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    local wk = require("which-key")

    wk.register({
      w = {
        r = { "<cmd>SessionRestore<CR>", "Restore session for cwd" }, -- restore last workspace session for current directory
        s = { "<cmd>SessionSave<CR>", "Save session for auto session root dir" }, -- save workspace session for current working directory
      },
    }, { prefix = "<leader>" })
  end,
}
