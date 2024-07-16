return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local wk = require("which-key")

      -- Actions in normal mode
      wk.add({
        { "<leader>[", gs.prev_hunk, buffer = bufnr, desc = "Previous hunk" },
        { "<leader>]h", gs.next_hunk, buffer = bufnr, desc = "Next hunk" },
        { "<leader>h", buffer = bufnr, group = "gitsigns" },
        { "<leader>hB", gs.toggle_current_line_blame, buffer = bufnr, desc = "Toggle line blame" },
        {
          "<leader>hD",
          function()
            gs.diffthis("~")
          end,
          buffer = bufnr,
          desc = "Diff this ~",
        },
        { "<leader>hR", gs.reset_buffer, buffer = bufnr, desc = "Reset buffer" },
        { "<leader>hS", gs.stage_buffer, buffer = bufnr, desc = "Stage buffer" },
        {
          "<leader>hb",
          function()
            gs.blame_line({ full = true })
          end,
          buffer = bufnr,
          desc = "Blame line",
        },
        { "<leader>hd", gs.diffthis, buffer = bufnr, desc = "Diff this" },
        { "<leader>hp", gs.preview_hunk, buffer = bufnr, desc = "Preview hunk" },
        { "<leader>hr", gs.reset_hunk, buffer = bufnr, desc = "Reset hunk" },
        { "<leader>hs", gs.stage_hunk, buffer = bufnr, desc = "Stage hunk" },
        { "<leader>hu", gs.undo_stage_hunk, buffer = bufnr, desc = "Undo stage hunk" },
      })

      -- Actions in visual mode
      wk.add({
        { "<leader>h", group = "gitsigns" },
        {
          "<leader>hr",
          function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          desc = "Reset hunk",
        },
        {
          "<leader>hs",
          function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          desc = "Stage hunk",
        },
      }, {
        buffer = bufnr,
      })

      wk.add({
        { "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "Gitsigns select hunk" },
      }, {
        mode = { "o", "x" },
      })
    end,
  },
}
