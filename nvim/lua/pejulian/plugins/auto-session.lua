return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    local wk = require("which-key")

    wk.add({
      { "<leader>w", group = "workspace" },
      { "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session for cwd" },
      { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session for auto session root dir" },
    })
  end,
}
