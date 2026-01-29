local on_attach = function(client, _)
  -- if client.name == "clangd" then
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end
end


-- ===== Mason =====
require("mason").setup({
  ui = {
    icons = { package_installed = "✓" },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "lua_ls", "ltex", "pylsp" },
})

-- ===== nvim-cmp =====
local cmp = require("cmp")

local snip_ok, luasnip = pcall(require, "luasnip")
if not snip_ok then
  return
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
      :sub(col, col)
      :match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<CR>"]  = cmp.mapping.confirm({ select = true }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
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
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

-- Optional formatting with lspkind
local ok_lspkind, lspkind = pcall(require, "lspkind")
if ok_lspkind then
  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        ellipsis_char = "...",
      }),
    },
  })
end

-- Capabilities (after cmp is set up)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- ===== LSP servers =====

vim.lsp.config("clangd", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config("ltex", {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "tex", "bib", "markdown", "plaintex" },
  settings = {
    ltex = {
      language = "en-US",
      dictionary = {
        ["en-US"] = {
          "Diego", "Rivera", "Garrido",
          "simplicial", "simplices",
          "isomorphism", "homomorphism", "homomorphisms",
          "homotopic", "homotopy",
          "Kruskal",
          "surjective", "injective", "bijective",
          "triangulable", "triangulations", "Triangulations",
          "TODO",
          "monoid", "Monoid", "submonoid", "monoids", "submonoids",
          "surjectivity", "injectivity",
          "subsemigroup", "coset",
          "idempotent", "idempotents",
        },
      },
    },
  },
})

vim.lsp.config("pylsp", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.enable({ "clangd", "lua_ls", "ltex", "pylsp" })

-- ===== Diagnostics =====
local ok_diaglist, diaglist = pcall(require, "diaglist")
if ok_diaglist then
  diaglist.init({
    debug = false,
    debounce_ms = 150,
  })
end

vim.diagnostic.config({
  virtual_text = { prefix = "●" },
})

