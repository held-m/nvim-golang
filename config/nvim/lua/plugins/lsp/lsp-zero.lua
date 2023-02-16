-- LSP CONF
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
  set_lsp_keymaps = {preserve_mappings = false},
})

lsp.nvim_workspace()

lsp.setup()
