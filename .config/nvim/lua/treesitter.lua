local set = vim.opt

local configs = require'nvim-treesitter.configs'
configs.setup {

	ensure_installed = { "cpp", "lua", "java", "python" },
	auto_install = true,
	highlight = {enable = true},
	indent = {enable = true}
}


-- set.foldmethod = "expr"
-- set.foldexpr = "nvim_treesitter#foldexpr()"

