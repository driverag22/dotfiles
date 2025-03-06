vim.g.vimtex_compiler_latexmk = {
    build_dir = 'build',
    options = {
        '-pdf',
        '-shell-escape',
        '-pvc',
        '-interaction=nonstopmode',
        '-synctex=1',
        '-outdir=build'
    },
}

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'

-- -- Autocompile and run
-- vim.api.nvim_create_augroup('compileAndRun', { clear = true })

-- -- LaTeX
-- vim.api.nvim_create_autocmd({ 'FileType' }, {
--   group = 'compileAndRun',
--   pattern = { 'tex' },
--   callback = function()
--       vim.api.nvim_set_keymap(
--           'n',
--           '<Leader>c',
--           ':w<CR>:split|terminal latexmk -pvc -f -verbose -file-line-error -synctex=1 -interaction=nonstopmode -pdf %<CR>',
--           { noremap = true, silent = true }
--       )
--   end,
-- })

