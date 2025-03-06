local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

--- Color theme, icons
Plug 'miikanissi/modus-themes.nvim'
Plug 'NvChad/nvim-colorizer.lua' -- color preview
Plug 'kyazdani42/nvim-web-devicons' -- More Icons
Plug 'ryanoasis/vim-devicons' -- Developer Icons

--- Buffer and status/bottom line
Plug('akinsho/bufferline.nvim', { ['tag'] = '*'}) -- bufferline
Plug 'nvim-lualine/lualine.nvim' -- status line

--- Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim' -- dependency
Plug 'BurntSushi/ripgrep' --  grep
Plug 'sharkdp/fd'  --- finder
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' }) -- finder
Plug "nvim-telescope/telescope-file-browser.nvim" -- fileBrowser


--- Misc
Plug 'lervag/vimtex' -- vimtex
Plug 'lewis6991/gitsigns.nvim' -- git integration
Plug 'kdheepak/lazygit.nvim' --- lazygit integration
Plug 'folke/which-key.nvim' -- which-key, help with mappings
Plug 'tpope/vim-commentary' -- For Commenting gcc 

--- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})

---- LSP
Plug 'neovim/nvim-lspconfig' -- Lsp
Plug 'hrsh7th/nvim-cmp' -- Completion
Plug 'hrsh7th/cmp-nvim-lsp' -- plugins
Plug 'hrsh7th/cmp-buffer' -- to go 
Plug 'hrsh7th/cmp-path' -- with
Plug 'hrsh7th/cmp-cmdline' -- Lsp

Plug 'onsails/lspkind.nvim' -- Add pictograms to lsp
Plug 'onsails/diaglist.nvim' -- Live lsp diagnostics in quickfix & loclist

---- LSP Installer
Plug "williamboman/mason.nvim" -- lsp installer
Plug "williamboman/mason-lspconfig.nvim"

---- Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

vim.call('plug#end')

require('gitsigns').setup()
require('lualine').setup()
require("colorizer").attach_to_buffer(0, { mode = "background", css = true})
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
require("luasnip").config.set_config({ -- Setting LuaSnip config
  -- Enable autotriggered snippets
  enable_autosnippets = true,
  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<S-Tab>",
})

require("which-key").add({
    { "<leader>f", group = "file" },
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
})

require('telescope').load_extension('fzf')
