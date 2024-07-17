return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = require("onedarkpro.helpers").get_colors("onedark")
    local config = require("onedarkpro.config").config

    local inactive_bg = config.options.highlight_inactive_windows and colors.color_column or colors.bg

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.green, fg = colors.bg },
        b = { bg = colors.fg_gutter, fg = colors.green },
        c = { bg = config.options.lualine_transparency and colors.none or colors.bg_statusline, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.blue, fg = colors.bg },
        b = { bg = colors.fg_gutter, fg = colors.blue },
      },
      visual = {
        a = { bg = colors.yellow, fg = colors.bg },
        b = { bg = colors.fg_gutter, fg = colors.yellow },
      },
      command = {
        a = { bg = colors.purple, fg = colors.bg },
        b = { bg = colors.fg_gutter, fg = colors.purple },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg },
        b = { bg = colors.fg_gutter, fg = colors.red },
      },
      inactive = {
        a = { bg = inactive_bg, fg = colors.blue },
        b = { bg = inactive_bg, fg = colors.fg_gutter_inactive, gui = "bold" },
        c = { bg = config.options.lualine_transparency and colors.none or inactive_bg, fg = colors.fg_gutter_inactive },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
