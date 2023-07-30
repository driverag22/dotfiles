local set = vim.opt
local function nkeymap(key, map)
	vim.keymap.set('n', key, map, {noremap = true})
end
-- vim.g.mapleader = " "

-----------------------------------------
---- Telescope:

local builtin = require('telescope.builtin')
nkeymap('<leader>ff', builtin.find_files)
nkeymap('<leader>fg', builtin.live_grep)
nkeymap('<leader>fb', builtin.buffers)
nkeymap('<leader>fh', builtin.help_tags)

-----------------------------------------
-----------------------------------------

-----------------------------------------
-- Misc:
nkeymap('<C-b>', ':redo<CR>') -- redo

nkeymap('<leader>gg', ':LazyGit<CR>') -- LazyGit

nkeymap('<C-t>', ':NERDTreeToggle<CR>') -- LazyGit

--move wrapped lines like normal lines
nkeymap('j', 'gj') -- LazyGit
nkeymap('k', 'gk') -- LazyGit

-----------------------------------------
-----------------------------------------

-----------------------------------------
-- Tabs: 

nkeymap('<leader>ot', ':tabnew<CR>') -- open new tab
nkeymap('<leader>ct', ':tabclose<CR>') -- close tab 
nkeymap('<M-m>', ':tabnext<CR>') -- move to tab to the right
nkeymap('<M-n>', ':tabprevious<CR>') -- move to tab to the left

-----------------------------------------
-----------------------------------------

-----------------------------------------
--tasks
nkeymap('<leader>td', ':TaskWikiDelete<CR>') -- delete task
nkeymap('<leader>tc', ':TaskWikiCalendar<CR>') -- open taskwiki calendar
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

nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>') -- go to definition
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>') -- go to declaration
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>') -- go to implementation
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>') -- 
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>') -- 
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>') -- get all references 
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>') -- get type definition
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>') -- documentation 
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>') -- 
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>') -- 
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>') -- rename

-- vim.keymap.set('n', 'mm', codewindow.toggle_minimap())

nkeymap('<leader>dw', ":lua require('diaglist').open_all_diagnostics()<cr>") -- Open buffer with LSP diagnostics

-----------------------------------------
-----------------------------------------


-- '{ + <Enter>' mapped to add second '}' below and start line in between '{' and '}'
vim.keymap.set('i', '{<Enter>', '{<Enter>}<Esc>O', {noremap = true})
