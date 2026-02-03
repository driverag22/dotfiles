vim.loader.enable()

require "basic_config"
require "lazy_bootstrap"
require "keybindings"
require "treesitter"
require "latexCompiler"

vim.cmd.colorscheme("modus_vivendi") -- must go after lazy
vim.api.nvim_set_hl(0, "CursorLine", {
  bg = "#1f1f1f"
})
