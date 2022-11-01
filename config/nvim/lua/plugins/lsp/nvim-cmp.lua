-- Set up nvim-cmp.
  local cmp = require'cmp'
  local luasnip = require("luasnip")
  local s = {} -- rename s to what is it

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

	-- when menu is visible, navigate to next item
	-- when line is empty, insert a tab character
	-- else, activate completion
	['<Tab>'] = cmp.mapping(function(fallback)
	  if cmp.visible() then
		cmp.select_next_item(select_opts)
	  elseif s.check_back_space() then
		fallback()
	  else
		cmp.complete()
	  end
	end, {'i', 's'}),

	-- when menu is visible, navigate to previous item on list
	-- else, revert to default behavior
	['<S-Tab>'] = cmp.mapping(function(fallback)
	  if cmp.visible() then
		cmp.select_prev_item(select_opts)
	  else
		fallback()
	  end
	end, {'i', 's'}),
	}),

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip', option = { show_autosnippets = true } }, -- For luasnip users.
    },
	{
		{
			name = 'buffer',
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}	
		},
	},
	{
		{ name = 'path' }
	}
	)
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
       { name = 'nvim_lsp' },
       { name = 'path' },
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }

s.check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end
