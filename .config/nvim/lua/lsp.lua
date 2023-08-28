local on_attach = function(client, bufnr) end

-- require('lspconfig').grammarly.setup {on_attach = on_attach}
require('lspconfig').cssls.setup {on_attach = on_attach}
require('lspconfig').html.setup {on_attach = on_attach}
require('lspconfig').quick_lint_js.setup {on_attach = on_attach}
-- require('lspconfig').texlab.setup {on_attach = on_attach}
require('lspconfig').ltex.setup {on_attach = on_attach}
require('lspconfig').lua_ls.setup {on_attach = on_attach}
require('lspconfig').clangd.setup {on_attach = on_attach}
require('lspconfig').jdtls.setup {on_attach = on_attach}
require('lspconfig').pyright.setup {on_attach = on_attach}
require('lspconfig').zk.setup {on_attach = on_attach}
-- require('lspconfig').volar.setup {on_attach = on_attach}
require('lspconfig').tsserver.setup {on_attach = on_attach}

require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}
require("mason-lspconfig").setup {}

---------------------------
-- ==== CMP portion ==== --
---------------------------

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
      -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require('lspconfig')['jdtls'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.texlab.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.ltex.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ltex = {
            disabledRules = { ['en-US'] = { 'PROFANITY' } },
            dictionary = {
                ['en-US'] = {'Diego', 'Rivera', 'Garrido'},
            },
        },
    },
}

-- require('lspconfig')['volar'].setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }


require('lspconfig')['quick_lint_js'].setup {
    capabilities = capabilities
}

require('lspconfig')['html'].setup {
    capabilities = capabilities
}

require('lspconfig')['cssls'].setup {
    capabilities = capabilities
}

require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
}

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show symbol and text
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
}

require("diaglist").init({
    -- optional settings
    -- below are defaults
    debug = false, 

    -- increase for noisy servers
    debounce_ms = 150,
})
