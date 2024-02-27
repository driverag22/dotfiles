vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.tabstop=4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true    
vim.opt.foldlevelstart = 1

        -- :colorscheme oxocarbon
    -- :colorscheme tokyonight-night
vim.cmd ([[

    :colorscheme modus-vivendi
		let g:NERDTreeDirArrowExpandable="+"
	 	let g:NERDTreeDirArrowCollapsible="~"
    let g:taskwiki_dont_fold="yes"
    autocmd BufWritePost,BufEnter * set nofoldenable foldmethod=manual foldlevelstart=99
    :set mouse=a

    let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \ }
    let g:vimtex_view_method = 'zathura'
]])

        --- let g:loaded_node_provider = 0
        -- let g:taskwiki_source_tw_colors="yes"
        -- let wiki = {}
        -- let wiki.path = "~/vimwiki/' 
        -- let wiki.nested_syntaxes = {'python':'python', 'java':'java', 'c++':'cpp'}
        -- let g:vimwiki_list = [wiki]

function ClearReg()
  print('Clearing registers')
  vim.cmd [[
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
    call setreg(r, [])
    endfor
]]
end

--Make it so i can call ClearReg as a command
vim.api.nvim_create_user_command('ClearReg', function()
  ClearReg()
end, {})
