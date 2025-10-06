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

-- -- vimtex core setup
-- vim.g.vimtex_view_method = 'sioyek'          -- use Sioyek as the PDF viewer
-- vim.g.vimtex_compiler_progname = 'nvr'       -- for inverse search with Neovim (requires `nvr`)

-- -- latexmk options (vimtex runs it in the background for you)
-- vim.g.vimtex_compiler_latexmk = {
--   options = {
--     "-pdf",
--     "-file-line-error",
--     "-synctex=1",
--     "-interaction=nonstopmode",
--   },
--   continuous = 1, -- use -pvc-like continuous mode
-- }

-- -- Optional: use a build dir
-- -- vim.g.vimtex_compiler_latexmk.build_dir = "build"

-- -- Keymap: start compile + open viewer, buffer-local for tex
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'tex',
--   callback = function(ev)
--     -- `ctx` to compile (continuous) and show the PDF in Sioyek
--     vim.keymap.set('n', 'ctx', function()
--       vim.cmd('VimtexCompile')
--       -- open (or focus) the viewer; small defer so first build can start
--       vim.defer_fn(function()
--         vim.cmd('VimtexView')
--       end, 400)
--     end, { buffer = ev.buf, silent = true, noremap = true })
--   end,
-- })
