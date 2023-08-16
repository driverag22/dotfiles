vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = a
vim.opt.termguicolors = true
vim.opt.tabstop = 4	-- 4 space tab
vim.opt.shiftwidth = 4 -- indents will have a width 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true    
vim.opt.foldlevelstart = 1

vim.cmd ([[

        :colorscheme tokyonight-moon
		let g:NERDTreeDirArrowExpandable="+"
	 	let g:NERDTreeDirArrowCollapsible="~"
        let g:taskwiki_dont_fold="yes"
        let g:vimtex_compiler_latexmk = {
        \ 'options' : [
        \   '-pdf',
        \   '-shell-escape',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
        autocmd BufWritePost,BufEnter * set nofoldenable foldmethod=manual foldlevelstart=99
        let g:vimtex_view_method = 'zathura'
        let g:hardtime_default_on = 1

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
