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

    -- This loads the live grep args for telescope
    telescope.load_extension("live_grep_args")

    -- set keymaps
    local wk = require("which-key")

    wk.add({
      { "<leader>f", group = "telescope" },
      { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
      {
        "<leader>fg",
        function()
          telescope.extensions.live_grep_args.live_grep_args()
        end,
        desc = "Live grep with arguments",
      },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
      { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
    })
  end,
}
