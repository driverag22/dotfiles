vim.o.mouse="a"
vim.g.have_nerd_font = true
vim.o.cursorline = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.termguicolors = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true

vim.o.foldlevelstart = 1
vim.o.smartcase = true

vim.g.mapleader = " "

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.foldenable = false
    vim.opt_local.foldmethod = "manual"
    vim.opt_local.foldlevelstart = 99
  end,
})
