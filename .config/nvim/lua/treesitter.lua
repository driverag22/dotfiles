local vim = vim
-- local set = vim.opt

local configs = require('nvim-treesitter.configs')
configs.setup {
	ensure_installed = { "cpp", "lua", "python", "vim", "vimdoc", "latex"},
	auto_install = true,
	highlight = {enable = true, additional_vim_regex_highlighting = false},
	indent = {enable = true}
}
-- vim.cmd [[
--   highlight @lsp.type.variable guifg=#569CD6
-- ]]

-- set.foldmethod = "expr"
-- set.foldexpr = "nvim_treesitter#foldexpr()"

-- local api = vim.api
-- local M = {}
-- -- function to create a list of commands and convert them to autocommands
-- -------- This function is taken from https://github.com/norcalli/nvim_utils
-- function M.nvim_create_augroups(definitions)
--     for group_name, definition in pairs(definitions) do
--         api.nvim_command('augroup '..group_name)
--         api.nvim_command('autocmd!')
--         for _, def in ipairs(definition) do
--             local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
--             api.nvim_command(command)
--         end
--         api.nvim_command('augroup END')
--     end
-- end


-- local autoCommands = {
--     -- other autocommands
--     open_folds = {
--         {"BufReadPost,FileReadPost", "*", "normal zR"}
--     }
-- }

-- M.nvim_create_augroups(autoCommands)
