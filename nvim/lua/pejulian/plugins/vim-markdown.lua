return {
  "plasticboy/vim-markdown",
  branch = "master",
  require = { "godlygeek/tabular" },
  config = function()
    vim.g.vim_markdown_follow_anchor = 1
    vim.g.vim_markdown_strikethrough = 1
    vim.g.vim_markdown_new_list_item_indent = 2
    vim.g.vim_markdown_borderless_table = 1
    vim.g.vim_markdown_fenced_languages = {
      "bash=sh",
      "sh=sh",
      "json=json",
      "python=python",
      "yaml=yaml",
      "typescript=typescript",
      "vim=vim",
      "ts=typescript",
    }
    vim.g.vim_markdown_anchorexpr = "<<'.v:anchor.'>>"
  end,
}
