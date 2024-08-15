vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true    
vim.opt.foldlevelstart = 1

vim.cmd ([[
    :colorscheme modus-vivendi
    :set mouse=a
    autocmd BufWritePost,BufEnter * set nofoldenable foldmethod=manual foldlevelstart=99

    let g:vimtex_compiler_latexmk = {
        \ 'options' : [
        \   '-pdf',
        \   '-shell-escape',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
    \ }
    let g:vimtex_view_method = 'zathura'
]])
