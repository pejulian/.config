return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local open_with_trouble = require("trouble.sources.telescope").open

    -- Use this to add more results without clearing the trouble list
    -- local add_to_trouble = require("trouble.sources.telescope").add

    -- This loads the live grep args for telescope
    telescope.load_extension("live_grep_args")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-t>"] = open_with_trouble,
          },
          n = {
            ["<C-t>"] = open_with_trouble,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local wk = require("which-key")
    wk.register({
      f = {
        name = "+telescope",
        f = { "<cmd>Telescope find_files<cr>", "Fuzzy find files in cwd" },
        r = { "<cmd>Telescope oldfiles<cr>", "Fuzzy find recent files" },
        s = { "<cmd>Telescope live_grep<cr>", "Find string in cwd" },
        c = { "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd" },
        t = { "<cmd>TodoTelescope<cr>", "Find todos" },
      },
    }, {
      prefix = "<leader>",
    })
  end,
}
