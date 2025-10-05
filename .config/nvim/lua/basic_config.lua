vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.foldlevelstart = 1
vim.opt.smartcase = true

vim.cmd ([[
    :colorscheme modus_vivendi
    :set mouse=a
    autocmd BufWritePost,BufEnter * set nofoldenable foldmethod=manual foldlevelstart=99
]])
