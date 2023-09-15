local function nkeymap(key, map, descr)
	vim.keymap.set('n', key, map, {noremap = true, desc = descr})
end

-----------------------------------------
---- Telescope:

local builtin = require('telescope.builtin')
nkeymap('<leader>ff', builtin.find_files, 'Telescope find file')
nkeymap('<leader>fg', builtin.live_grep, 'Telescope grep')
nkeymap('<leader>fb', builtin.buffers, 'Telescope buffers')
nkeymap('<leader>fh', builtin.help_tags, 'Telescope help')
nkeymap('<leader>fb', ':Telescope file_browser<CR>', 'Telescope file browser')

-----------------------------------------
-----------------------------------------

-----------------------------------------
-- Misc:
nkeymap('U', '<cmd>redo<CR>') -- redo

nkeymap('<Esc>', ':nohl<CR>') -- remove highlights

nkeymap('<leader>gg', ':LazyGit<CR>') -- LazyGit

nkeymap('<C-t>', ':NvimTreeToggle<CR>') -- Open/close nerd tree

--move wrapped lines like normal lines
nkeymap('j', 'gj')
nkeymap('k', 'gk')

-----------------------------------------
-----------------------------------------

-----------------------------------------
-- Buffers: 
nkeymap('<leader>x', ':bdelete!<CR>') -- close buffer
nkeymap('<M-m>', ':bnext<CR>') -- move to previus buffer
nkeymap('<M-n>', ':bprev<CR>') -- move to next buffer

-----------------------------------------
-----------------------------------------

-----------------------------------------
--tasks
nkeymap('tto', ':TaskWikiToggle<CR>') -- toggle task (start / stop)

-----------------------------------------
-----------------------------------------

-----------------------------------------
--tex
nkeymap('ctx', ':VimtexCompile<CR>') -- Toggle tex compile
-----------------------------------------
-----------------------------------------


-----------------------------------------
--Lsp

nkeymap('gd', vim.lsp.buf.definition, 'Go to definition') -- go to definition
nkeymap('gD', vim.lsp.buf.declaration, 'Go to declaration') -- go to declaration
nkeymap('gi', vim.lsp.buf.implementation, 'Go to implementation') -- go to implementation
nkeymap('gs', vim.lsp.buf.workspace_symbol, 'Document/find query') -- 
nkeymap('gr', vim.lsp.buf.references, 'Get all references to object') -- get all references 
nkeymap('gt', vim.lsp.buf.type_definition, 'Jump to type definition') -- get type definition
nkeymap('gC', vim.lsp.buf.hover, 'Open documentation') -- documentation 
nkeymap('<leader>rn', vim.lsp.buf.rename, 'Rename all instances of') -- rename
nkeymap('<leader>e', vim.diagnostic.open_float, 'Rename all instances of') -- rename
-- nkeymap('gw', vim.lsp.buf.document_symbol()<cr>', 'Document/find query') -- 
-- nkeymap('<C-k>', vim.lsp.buf.signature_help()<cr>') -- 
-- nkeymap('<leader>af', vim.lsp.buf.code_action()<cr>') -- 

-- vim.keymap.set('n', 'mm', codewindow.toggle_minimap())

nkeymap('<leader>dw', ":lua require('diaglist').open_all_diagnostics()<cr>", 'Open diagnostics buffer') -- Open buffer with LSP diagnostics

-----------------------------------------
-----------------------------------------


-- '{ + <Enter>' mapped to add second '}' below and start line in between '{' and '}'
vim.keymap.set('i', '{<Enter>', '{<Enter>}<Esc>O', {noremap = true})


