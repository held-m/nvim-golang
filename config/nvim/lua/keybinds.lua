vim.g.mapleader = ";"

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Move cursor in interactive mod
map('i', '<C-A>', '<ESC>A')
map('i', '<C-I>', '<ESC>I')

-- NvimTreeToggle Open 
map('n', '<C-J>', '<CMD>NvimTreeToggle<CR>')
map('i', '<C-J>', '<CMD>NvimTreeToggle<CR>')
map('x', '<C-J>', '<CMD>NvimTreeToggle<CR>')
-- NvimTreeToggle Find
map('n', '<C-F>', '<CMD>NvimTreeFindFile<CR>')
map('i', '<C-F>', '<CMD>NvimTreeFindFile<CR>')
map('x', '<C-F>', '<CMD>NvimTreeFindFile<CR>')

-- FzfLua find a file
map('n', '<C-P>', '<CMD>FzfLua files<CR>')
map('i', '<C-P>', '<CMD>FzfLua files<CR>')
map('v', '<C-P>', '<CMD>FzfLua files<CR>')
-- FzfLua find a text
map('n', '<Leader>t', '<CMD>FzfLua grep<CR>')
map('i', '<Leader>t', '<CMD>FzfLua grep<CR>')
map('v', '<Leader>t', '<CMD>FzfLua grep<CR>')
-- FzfLua find a word
map('n', '<Leader>w', '<CMD>FzfLua grep_cword<CR>')
map('i', '<Leader>w', '<CMD>FzfLua grep_cword<CR>')
map('v', '<Leader>w', '<CMD>FzfLua grep_cword<CR>')
-- FzfLua open FzfLua
map('n', '<Leader>o', '<CMD>FzfLua<CR>')
map('i', '<Leader>o', '<CMD>FzfLua<CR>')
map('v', '<Leader>o', '<CMD>FzfLua<CR>')
-- Formater
map('n', '<Leader>f', '<CMD>Format<CR>')
map('n', '<Leader>F', '<CMD>FormatWrite<CR>')

vim.api.nvim_set_keymap("i", "<C-/>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
