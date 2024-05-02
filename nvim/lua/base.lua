vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.ai = true -- for auto indent
vim.opt.si = true -- for smart indent
vim.opt.wrap = false -- no wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- finding files , search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' } -- ignore node_modules 

vim.opt.formatoptions:append { 'r' } -- add asterisks in block comments

vim.g.mapleader = " "
