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

-----------------------------------------
-----------------------------------------

-----------------------------------------
-- Misc:
nkeymap('<C-b>', ':redo<CR>') -- redo

nkeymap('<leader>gg', ':LazyGit<CR>') -- LazyGit

nkeymap('<C-t>', ':NvimTreeToggle<CR>') -- Open/close nerd tree

--move wrapped lines like normal lines
nkeymap('j', 'gj')
nkeymap('k', 'gk')

-----------------------------------------
-----------------------------------------

-----------------------------------------
-- Tabs: 

nkeymap('<leader>bd', ':bdelete<CR>') -- close buffer
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

nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>', 'Go to definition') -- go to definition
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>', 'Go to declaration') -- go to declaration
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>', 'Go to implementation') -- go to implementation
nkeymap('gs', ':lua vim.lsp.buf.workspace_symbol()<cr>', 'Document/find query') -- 
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>', 'Get all references to object') -- get all references 
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>', 'Jump to type definition') -- get type definition
nkeymap('gC', ':lua vim.lsp.buf.hover()<cr>', 'Open documentation') -- documentation 
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>', 'Rename all instances of') -- rename
-- nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>', 'Document/find query') -- 
-- nkeymap('<C-k>', ':lua vim.lsp.buf.signature_help()<cr>') -- 
-- nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>') -- 

-- vim.keymap.set('n', 'mm', codewindow.toggle_minimap())

nkeymap('<leader>dw', ":lua require('diaglist').open_all_diagnostics()<cr>", 'Open diagnostics buffer') -- Open buffer with LSP diagnostics

-----------------------------------------
-----------------------------------------


-- '{ + <Enter>' mapped to add second '}' below and start line in between '{' and '}'
vim.keymap.set('i', '{<Enter>', '{<Enter>}<Esc>O', {noremap = true})
