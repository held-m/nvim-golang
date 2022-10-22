vim.cmd [[set mouse=a]]

-- clipboard
vim.o.clipboard = 'unnamedplus'

-- show numbers line
vim.opt.number = true

-- set tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4


-- turn off bad providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- save history for undo
-- vim.opt.undodir = vim.fn.expand('~/.nvim/undodir')
vim.o.undofile = true

vim.wo.colorcolumn = "120"
