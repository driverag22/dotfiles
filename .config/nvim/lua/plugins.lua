local Plug = vim.fn['plug#']

---- Plugins:
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'http://github.com/tpope/vim-surround' -- Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' -- NerdTree
Plug 'https://github.com/tpope/vim-commentary' -- For Commenting gcc 
Plug 'https://github.com/rafi/awesome-vim-colorschemes' -- Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' -- Developer Icons
Plug 'lewis6991/gitsigns.nvim' -- git integration
-- Plug 'https://github.com/terryma/vim-multiple-cursors' -- CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' -- Tagbar for code navigation

--================================================================
Plug 'https://github.com/neovim/nvim-lspconfig' -- Lsp
Plug 'https://github.com/williamboman/nvim-lsp-installer' -- Lsp installers
Plug 'hrsh7th/nvim-cmp' -- Completion
Plug 'hrsh7th/cmp-nvim-lsp' -- plugins
Plug 'hrsh7th/cmp-buffer' -- to go 
Plug 'hrsh7th/cmp-path' -- with
Plug 'hrsh7th/cmp-cmdline' -- Lsp

--Snippets:
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
--=========

Plug 'mhinz/vim-startify' -- startup screen // dashboard

Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})

Plug "SmiteshP/nvim-gps"
Plug 'Pocco81/true-zen.nvim'
Plug 'NvChad/nvim-colorizer.lua' -- color preview
Plug 'kyazdani42/nvim-web-devicons' -- More Icons
Plug 'feline-nvim/feline.nvim' -- bar 
Plug 'https://github.com/nanozuki/tabby.nvim' -- to have tabs
Plug 'nvim-lua/plenary.nvim'
Plug 'navarasu/onedark.nvim' -- colorscheme
Plug('akinsho/toggleterm.nvim', {['tag'] = '*'}) -- terminal
Plug('xiyaowong/nvim-transparent') -- make background transparent

-- Plug 'gorbit99/codewindow.nvim' -- code minimap

vim.call('plug#end')

require('gitsigns').setup()
require("toggleterm").setup()
require("nvim-gps").setup()
require("tabby").setup({
	tabline = require("tabby.presets").tab_only
})
require('onedark').setup {
    style = 'deep'
}
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})
require("colorizer").attach_to_buffer(0, { mode = "background", css = true})
