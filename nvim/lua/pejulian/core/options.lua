vim.cmd("let g:netrw_liststyle = 3") -- make the default file explorer in nvim use the tree display style

local opt = vim.opt
local api = vim.api

-- basic
opt.shell = "zsh"
opt.title = true -- show title of file in window
opt.titlelen = 0 -- do not shorten title
opt.cmdheight = 1
opt.showcmd = true
opt.scrolloff = 10 -- use :h scrolloff to understand this more
opt.sidescrolloff = 5 -- use :h sidescrolloff to understand this more

-- encodings
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
opt.autoread = true
api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = "*",
})

-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = "*",
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- check if we are in windows
vim.cmd([[
  if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
      let g:os = "Windows"
    else
      let g:os = substitute(system("uname"), "\n", "", "")
    endif
  endif
]])

-- if in Windows is running, set clipboard to use win32yank
vim.cmd([[
  if has("gui_running")
    if g:os == "Windows"
      let g:clipboard = {
        \ "name": "win32yank-wsl",
        \ "copy": {
        \   "+": "win32yank.exe -i --crlf",
        \   "*": "win32yank.exe -i --crlf",
        \ },
        \ "paste": {
        \   "+": "win32yank.exe -o --lf",
        \   "*": "win32yank.exe -o --lf",
        \ },
        \ "cache_enabled": 0,
      \ }
    endif
  endif
]])

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- code folding
opt.foldmethod = "indent"
opt.foldlevel = 20
