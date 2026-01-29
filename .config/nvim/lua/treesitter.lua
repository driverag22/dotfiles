-- Start TS highlighting automatically, but only if not already active
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "lua", "python", "tex", "markdown" },
  callback = function(args)
    local buf = args.buf
    if vim.treesitter.highlighter.active[buf] then
      return
    end
    vim.treesitter.start(buf)
  end,
})
