local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')


--===================================================
--- Telescope
Plug 'http://github.com/nvim-lua/plenary.nvim' -- 
Plug 'http://github.com/BurntSushi/ripgrep' --  grep
Plug 'https://github.com/sharkdp/fd'  --- finder
vim.cmd ([[
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
]])
--------------------------------------------------------
--===================================================


--===================================================
---- Misc

Plug 'http://github.com/tpope/vim-surround' -- Surrounding ysw)
-- Plug 'https://github.com/preservim/nerdtree' -- NerdTree
Plug 'lervag/vimtex' -- vimtex
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
Plug 'https://github.com/tpope/vim-commentary' -- For Commenting gcc 
Plug 'lewis6991/gitsigns.nvim' -- git integration
Plug 'kdheepak/lazygit.nvim' --- lazygit integration

-----------------------------------------------------
--===================================================


--===================================================
---- LSP
Plug 'https://github.com/neovim/nvim-lspconfig' -- Lsp
Plug 'hrsh7th/nvim-cmp' -- Completion
Plug 'hrsh7th/cmp-nvim-lsp' -- plugins
Plug 'hrsh7th/cmp-buffer' -- to go 
Plug 'hrsh7th/cmp-path' -- with
Plug 'hrsh7th/cmp-cmdline' -- Lsp

---- LSP Installer
Plug "williamboman/mason.nvim" -- lsp installer
Plug "williamboman/mason-lspconfig.nvim"

---- Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

-----------------------------------------------------
--===================================================


--===================================================
---- Colors, status line, tab line, icons
Plug 'https://github.com/folke/tokyonight.nvim' 
Plug 'nvim-lualine/lualine.nvim'
Plug 'https://github.com/nanozuki/tabby.nvim' -- better tabline
Plug 'NvChad/nvim-colorizer.lua' -- color preview
Plug 'kyazdani42/nvim-web-devicons' -- More Icons
Plug 'https://github.com/ryanoasis/vim-devicons' -- Developer Icons
-- Plug 'https://github.com/rafi/awesome-vim-colorschemes' -- Retro Schemes
------------------------------------------------------
--===================================================


--===================================================
---- Taskwarrior
Plug 'vimwiki/vimwiki' -- vim wiki
Plug 'tools-life/taskwiki' -- task-wiki
Plug 'powerman/vim-plugin-AnsiEsc' -- color support for charts
Plug 'farseer90718/vim-taskwarrior'  --grid view
------------------------------------------------------
--===================================================

vim.call('plug#end')


require('gitsigns').setup()
require('lualine').setup()
require("colorizer").attach_to_buffer(0, { mode = "background", css = true})
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})

