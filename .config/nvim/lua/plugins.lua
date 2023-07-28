local Plug = vim.fn['plug#']

---- Plugins:
vim.call('plug#begin', '~/.config/nvim/plugged')

------------ For telescope
Plug 'http://github.com/nvim-lua/plenary.nvim' -- 
Plug 'http://github.com/BurntSushi/ripgrep' --  grep
Plug 'https://github.com/sharkdp/fd'  --- finder
vim.cmd ([[
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
]])
--------------------------------------------------------

Plug 'http://github.com/tpope/vim-surround' -- Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' -- NerdTree
Plug 'https://github.com/tpope/vim-commentary' -- For Commenting gcc 
Plug 'https://github.com/ryanoasis/vim-devicons' -- Developer Icons
Plug 'lewis6991/gitsigns.nvim' -- git integration

--================================================================
Plug 'https://github.com/neovim/nvim-lspconfig' -- Lsp
Plug 'hrsh7th/nvim-cmp' -- Completion
Plug 'hrsh7th/cmp-nvim-lsp' -- plugins
Plug 'hrsh7th/cmp-buffer' -- to go 
Plug 'hrsh7th/cmp-path' -- with
Plug 'hrsh7th/cmp-cmdline' -- Lsp

Plug "williamboman/mason.nvim" -- lsp installer
Plug "williamboman/mason-lspconfig.nvim"
--Snippets:
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
--=========

Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})

Plug 'NvChad/nvim-colorizer.lua' -- color preview
Plug 'kyazdani42/nvim-web-devicons' -- More Icons
-- Plug 'feline-nvim/feline.nvim' -- bar 
Plug 'nvim-lualine/lualine.nvim'

Plug 'https://github.com/romgrk/barbar.nvim' -- better tabline

-- Plug 'EdenEast/nightfox.nvim' 
Plug 'navarasu/onedark.nvim' -- colorscheme for bottom bar
-- Plug 'https://github.com/sekke276/dark_flat.nvim' -- colorscheme 
Plug 'https://github.com/rafi/awesome-vim-colorschemes' -- Retro Schemes

Plug('akinsho/toggleterm.nvim', {['tag'] = '*'}) -- terminal

Plug 'vimwiki/vimwiki' -- vim wiki
Plug 'tools-life/taskwiki' -- task-wiki
Plug 'powerman/vim-plugin-AnsiEsc' -- color support for charts
Plug 'farseer90718/vim-taskwarrior'  --grid view

Plug 'lervag/vimtex' -- vimtex

vim.call('plug#end')

require('gitsigns').setup()
require('onedark').setup {
    style = 'deep'
}

require("colorizer").attach_to_buffer(0, { mode = "background", css = true})
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",

  -- region_check_events = 'InsertEnter',
  -- delete_check_events = 'InsertLeave'
})

require("toggleterm").setup()

require('lualine').setup()
