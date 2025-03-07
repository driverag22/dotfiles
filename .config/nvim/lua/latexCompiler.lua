-- LaTeX
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'tex' },
  callback = function()
      vim.api.nvim_set_keymap(
          'n',
          'ctx', -- keybinding
            -- get filename.tex
          ':let fname=expand("%:p")<CR>' ..
            -- get filename.pdf
          ':let pdfname=expand("%:r") . ".pdf"<CR>' ..
            -- open terminal in new tab and compile filename.tex w/latexmk
          ':tabnew | terminal latexmk -pvc -f -verbose -file-line-error -synctex=1 -interaction=nonstopmode -pdf "<C-r>=fname<CR>"<CR>' ..
            -- open filename.pdf in zathura
          ':silent !zathura "<C-r>=pdfname<CR>" &<CR>',
          { noremap = true, silent = true }
      )
  end,
})
