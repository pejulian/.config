return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local wk = require("which-key")

      -- Actions in normal mode
      wk.register({
        h = {
          name = "gitsigns",
          s = { gs.stage_hunk, "Stage hunk" },
          r = { gs.reset_hunk, "Reset hunk" },
          S = { gs.stage_buffer, "Stage buffer" },
          R = { gs.reset_buffer, "Reset buffer" },
          u = { gs.undo_stage_hunk, "Undo stage hunk" },
          p = { gs.preview_hunk, "Preview hunk" },
          b = {
            function()
              gs.blame_line({ full = true })
            end,
            "Blame line",
          },
          B = { gs.toggle_current_line_blame, "Toggle line blame" },
          d = { gs.diffthis, "Diff this" },
          D = {
            function()
              gs.diffthis("~")
            end,
            "Diff this ~",
          },
        },
        ["]"] = {
          h = { gs.next_hunk, "Next hunk" },
        },
        ["["] = {
          gs.prev_hunk,
          "Previous hunk",
        },
      }, {
        prefix = "<leader>",
        mode = "n",
        buffer = bufnr,
      })

      -- Actions in visual mode
      wk.register({
        h = {
          name = "gitsigns",
          s = {
            function()
              gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            "Stage hunk",
          },
          r = {
            function()
              gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            "Reset hunk",
          },
        },
      }, {
        prefix = "<leader>",
        mode = "v",
        buffer = bufnr,
      })

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,
  },
}
