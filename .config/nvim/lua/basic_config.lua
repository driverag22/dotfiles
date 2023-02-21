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

		let g:NERDTreeDirArrowExpandable="+"
	 	let g:NERDTreeDirArrowCollapsible="~"
        let g:taskwiki_dont_fold="yes"
        autocmd BufWritePost,BufEnter * set nofoldenable foldmethod=manual foldlevelstart=99

]])

        -- let wiki = {}
        -- let wiki.path = "~/vimwiki/' 
        -- let wiki.nested_syntaxes = {'python':'python', 'java':'java', 'c++':'cpp'}
        -- let g:vimwiki_list = [wiki]
