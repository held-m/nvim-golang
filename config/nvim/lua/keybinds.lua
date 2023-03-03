-- vim.g.mapleader = "\"

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Move cursor in interactive mod
map('i', '<C-A>', '<ESC>A')
map('i', '<C-I>', '<ESC>I')

-- NvimTreeToggle Open 
map('n', '<Leader>o', '<CMD>NvimTreeToggle<CR>')
map('i', '<Leader>o', '<CMD>NvimTreeToggle<CR>')
map('x', '<Leader>o', '<CMD>NvimTreeToggle<CR>')
-- NvimTreeToggle Find
map('n', '<Leader>f', '<CMD>NvimTreeFindFile<CR>')
map('i', '<Leader>f', '<CMD>NvimTreeFindFile<CR>')
map('x', '<Leader>f', '<CMD>NvimTreeFindFile<CR>')

-- FzfLua find a file
map('n', '<C-P>', '<CMD>FzfLua files<CR>')
map('i', '<C-P>', '<CMD>FzfLua files<CR>')
map('v', '<C-P>', '<CMD>FzfLua files<CR>')
-- FzfLua find a text
map('n', '<Leader>Ft', '<CMD>FzfLua grep<CR>')
map('i', '<Leader>Ft', '<CMD>FzfLua grep<CR>')
map('v', '<Leader>Ft', '<CMD>FzfLua grep<CR>')
-- FzfLua find a word
map('n', '<Leader>Fw', '<CMD>FzfLua grep_cword<CR>')
map('i', '<Leader>Fw', '<CMD>FzfLua grep_cword<CR>')
map('v', '<Leader>Fw', '<CMD>FzfLua grep_cword<CR>')
-- FzfLua open FzfLua
map('n', '<Leader>Fo', '<CMD>FzfLua<CR>')
map('i', '<Leader>Fo', '<CMD>FzfLua<CR>')
map('v', '<Leader>Fo', '<CMD>FzfLua<CR>')
-- Formater
map('n', '<Leader>fF', '<CMD>Format<CR>')
map('n', '<Leader>ff', '<CMD>FormatWrite<CR>')

vim.api.nvim_set_keymap("i", "<C-/>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
