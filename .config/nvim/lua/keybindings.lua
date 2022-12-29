local set = vim.opt


---- Keymaps:
-- vim.keymap.set('n', '<C-f>', ':TZFocus<CR>', {noremap = true}) -- Focus mode
vim.keymap.set('n', '<C-g>', ':TZAtaraxis<CR>', {noremap = true}) -- Centered mode
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', {noremap = true}) -- Toggle file tree
vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>', {noremap = true}) -- Toggle tagbar

vim.keymap.set('n', '<C-p>', ':tabnew<CR>', {noremap = true}) -- new tab
vim.keymap.set('n', '<C-o>', ':tabclose<CR>', {noremap = true}) --close tab
vim.keymap.set('n', '<M-f>', ':tabnext<CR>', {noremap = true}) --move to tab to the right
vim.keymap.set('n', '<M-b>', ':tabprevious<CR>', {noremap = true}) --move to tab to the left


--move wrapped lines like normal lines
vim.keymap.set('n', 'j', 'gj', {noremap = true}) 
vim.keymap.set('n', 'k', 'gk', {noremap = true}) 

--terminal
vim.keymap.set('n', '<C-y>', ':ToggleTerm<CR>', {noremap = true, silent = true}) -- Open terminal
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]]) -- move 
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]]) -- between
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]]) -- the 
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]]) -- terminals



local function nkeymap(key, map)
	vim.keymap.set('n', key, map, {noremap = true})
end

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

vim.cmd ([[
"    		inoremap <silent><expr> <TAB>
"		  \ coc#pum#visible() ? coc#pum#next(1) :
"		  \ CheckBackspace() ? "\<Tab>" :
"		  \ coc#refresh()
"		inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" map < { + Enter > to automatically add second "}"
inoremap {<Enter> {<Enter>}<Esc>O


" map tab to complete for CoC
"		function! CheckBackspace() abort
"		  let col = col('.') - 1
"		  return !col || getline('.')[col - 1]  =~# '\s'
"		endfunction
		" Make <CR> to accept selected completion item or notify coc.nvim to format
		" <C-g>u breaks current undo, please make your own choice.
"		inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"								  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]])

