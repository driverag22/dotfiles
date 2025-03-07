local function nkeymap(key, map, descr)
	vim.keymap.set('n', key, map, {noremap = true, desc = descr})
end

-- Set space to be leader
vim.g.mapleader = " "

--- Telescope<Cmd>
local builtin = require('telescope.builtin')
nkeymap('<leader>ff', builtin.find_files, 'Telescope find file')
nkeymap('<leader>fg', builtin.live_grep, 'Telescope grep')
nkeymap('<leader>fb', builtin.buffers, 'Telescope buffers')
nkeymap('<leader>fh', builtin.help_tags, 'Telescope help')
nkeymap('<leader>fb', '<Cmd>Telescope file_browser<CR>', 'Telescope file browser')

--- Misc<Cmd>
nkeymap('U', '<cmd>redo<CR>') -- redo
nkeymap('<Esc>', '<Cmd>nohl<CR>') -- remove highlights
nkeymap('<leader>gg', '<Cmd>LazyGit<CR>') -- LazyGit

-- move wrapped lines like normal lines
nkeymap('j', 'gj')
nkeymap('k', 'gk')

--- Buffers<Cmd> 
nkeymap('<Leader>x', '<Cmd>bdelete!<CR>') -- close buffer
nkeymap('<M-.>', '<Cmd>bnext<CR>') -- move to previus buffer
nkeymap('<M-,>', '<Cmd>bprev<CR>') -- move to next buffer

---Lsp
nkeymap('gd', vim.lsp.buf.definition, 'Go to definition') -- go to definition
nkeymap('gD', vim.lsp.buf.declaration, 'Go to declaration') -- go to declaration
nkeymap('gi', vim.lsp.buf.implementation, 'Go to implementation') -- go to implementation
nkeymap('gs', vim.lsp.buf.workspace_symbol, 'Document/find query') -- 
nkeymap('gr', vim.lsp.buf.references, 'Get all references to object') -- get all references 
nkeymap('gt', vim.lsp.buf.type_definition, 'Jump to type definition') -- get type definition
nkeymap('gC', vim.lsp.buf.hover, 'Open documentation') -- documentation 
nkeymap('<Leader>e', vim.diagnostic.open_float, 'Open vim diagnostic in floating window') -- 
nkeymap('<leader>rn', vim.lsp.buf.rename, 'Rename all instances of') -- rename
-- nkeymap('gw', vim.lsp.buf.document_symbol()<cr>', 'Document/find query') -- 
-- nkeymap('<C-k>', vim.lsp.buf.signature_help()<cr>') -- 
-- nkeymap('<leader>af', vim.lsp.buf.code_action()<cr>') -- 

--- '{ + <Enter>' mapped to add second '}' below and start line in between '{' and '}'
vim.keymap.set('i', '{<Enter>', '{<Enter>}<Esc>O', {noremap = true})

--- Allow use Alt+Tab to jump positions in snippets,
--- for when completions are shown (in which case Tab just 
--- jumps through the completions :/)
vim.keymap.set({ "i", "s" }, "<A-Tab>", function()
  if require('luasnip').jumpable(1) then
    return "<Plug>luasnip-jump-next"
  end
  return "<A-Tab>"
end, { expr = true, noremap = true, silent = true })

