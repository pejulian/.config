return {
  "mrjones2014/legendary.nvim",
  priority = 10000,
  lazy = false,
  config = function()
    require("legendary").setup({
      extensions = {
        lazy_nvim = true,
        nvim_tree = true,
        which_key = {
          auto_register = false,
          mappings = {},
          do_binding = true,
          use_groups = true,
        },
      },
    })
  end,
}
