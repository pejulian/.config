return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      events = { "InsertLeave", "TextChaged" },
      conditions = {
        exists = true,
        filetype_is_not = {},
        modifiable = true,
      },
      write_all_buffers = false,
      on_off_commands = true,
      clean_command_line_interval = 0,
      debounce_delay = 135,
    })

    local wk = require("which-key")
    wk.register({
      a = {
        name = "Auto save",
        s = { "<cmd>ASToggle<CR>", "Toggle auto save" },
      },
    }, {
      prefix = "<leader>",
      mode = "n",
    })
  end,
}
