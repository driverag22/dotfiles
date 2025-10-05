-- vimtex core setup
vim.g.vimtex_view_method = 'sioyek'          -- use Sioyek as the PDF viewer
vim.g.vimtex_compiler_progname = 'nvr'       -- for inverse search with Neovim (requires `nvr`)

-- latexmk options (vimtex runs it in the background for you)
vim.g.vimtex_compiler_latexmk = {
  options = {
    "-pdf",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
  },
  continuous = 1, -- use -pvc-like continuous mode
}

-- Optional: use a build dir
-- vim.g.vimtex_compiler_latexmk.build_dir = "build"

-- Keymap: start compile + open viewer, buffer-local for tex
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function(ev)
    -- `ctx` to compile (continuous) and show the PDF in Sioyek
    vim.keymap.set('n', 'ctx', function()
      vim.cmd('VimtexCompile')
      -- open (or focus) the viewer; small defer so first build can start
      vim.defer_fn(function()
        vim.cmd('VimtexView')
      end, 400)
    end, { buffer = ev.buf, silent = true, noremap = true })
  end,
})


-- LaTeX
-- vim.api.nvim_create_autocmd({ 'FileType' }, {
--   pattern = { 'tex' },
--   callback = function()
--     vim.keymap.set('n', 'ctx', function()
--       local fname = vim.fn.expand('%:p')                   -- /full/path/file.tex
--       local pdfname = vim.fn.fnamemodify(fname, ':r') .. '.pdf'  -- /full/path/file.pdf

--       -- Open latexmk in a new tab terminal (persistent preview compile)
--       vim.cmd('tabnew')
--       vim.fn.termopen({
--         'latexmk',
--         '-pvc', '-f', '-verbose', '-file-line-error',
--         '-synctex=1', '-interaction=nonstopmode', '-pdf',
--         fname
--       })

--       -- Start Sioyek detached so it doesn't block and survives after vim command
--       -- If your first build is slow, uncomment the defer to give latexmk time:
--       -- vim.defer_fn(function()
--       --   vim.fn.jobstart({ 'sioyek', pdfname }, { detach = true })
--       -- end, 800) -- milliseconds
--       vim.fn.jobstart({ 'sioyek', pdfname }, { detach = true })
--     end, { buffer = true, silent = true, noremap = true })
--   end,
-- })
