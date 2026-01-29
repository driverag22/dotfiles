vim.loader.enable()

require "basic_config"
require "lazy_bootstrap"
vim.cmd.colorscheme("modus_vivendi") -- must go after lazy
require "keybindings"
require "treesitter"
require "latexCompiler"

