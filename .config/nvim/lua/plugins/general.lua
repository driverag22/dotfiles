return {
  -- Color theme, icons
  { "miikanissi/modus-themes.nvim", lazy = false, priority = 1000 },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Telescope
  { "nvim-lua/plenary.nvim", lazy = true },

  { "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
    end
  },

  { "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("fzf")
    end
  },

  { "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("file_browser")
    end
  },

  -- Misc
  { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end },

  { "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  { "folke/which-key.nvim", config = function()
      require("which-key").setup()
      require("which-key").add({
        { "<leader>f", group = "file" },
      }, { mode = { "n", "v" } })
    end
  },

  { "tpope/vim-commentary" },

  { "sphamba/smear-cursor.nvim", config = function() require("smear_cursor").setup() end },

  -- { "MunifTanjim/nui.nvim", lazy = true },
  -- { "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("hardtime").setup({ disable_mouse = false })
  --   end
  -- },

  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy=false
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "onsails/diaglist.nvim",
    },
    config = function()
      require("lsp")
    end,
  },

  { "williamboman/mason.nvim", config = function() require("mason").setup() end },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim" } },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },

  { "onsails/lspkind.nvim" },
  { "onsails/diaglist.nvim" },

  -- Snippets
  { "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "<S-Tab>",
      })
      require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.expand("~/.config/nvim/LuaSnip/") })
    end
  },
  { "saadparwaiz1/cmp_luasnip" },
}

