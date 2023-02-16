vim.cmd [[set mouse=a]]

-- clipboard
vim.o.clipboard = 'unnamedplus'

-- show numbers line
vim.opt.number = true

-- set tab
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- vim.g.go_highlight_operators=1
-- vim.g.go_highlight_functions=1
-- vim.g.go_highlight_function_parameters=1
-- vim.g.go_highlight_function_calls=1
-- vim.g.go_highlight_types=1
-- vim.g.go_highlight_fields=1


-- turn off bad providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

-- save history for undo
-- vim.opt.undodir = vim.fn.expand('~/.nvim/undodir')
vim.o.undofile = true

vim.wo.colorcolumn = "90"

vim.g.copilot_no_tab_map = true
