return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    vim.cmd([[
      function OpenMarkdownPreview (url)
        let cmd = chrome_browser . " --new-window " . shellescape(a:url) . " &"
        silent call system(cmd)
      endfunction
    ]])
    vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
  end,
}
