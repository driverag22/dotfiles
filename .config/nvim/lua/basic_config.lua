vim.opt.mouse="a"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true

vim.opt.foldlevelstart = 1
vim.opt.smartcase = true

vim.g.mapleader = " "

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.foldenable = false
    vim.opt_local.foldmethod = "manual"
    vim.opt_local.foldlevelstart = 99
  end,
})
