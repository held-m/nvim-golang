
-- list of plugins
-- require "paq" {
--     "savq/paq-nvim";                -- Let Paq manage itself
--
--     "neovim/nvim-lspconfig";        -- Mind the semi-colons
--     "hrsh7th/nvim-cmp";
--
--     {"lervag/vimtex", opt=true};    -- Use braces when passing Options
--
-- 	'held-m/neovim-sand';			-- Colorschema
--
-- 	{'VonHeikemen/lsp-zero.nvim'};
--
-- 	-- LSP Support
-- 	{'neovim/nvim-lspconfig'};
-- 	-- Mason for plugins
-- 	{'williamboman/mason.nvim'};
-- 	{'williamboman/mason-lspconfig.nvim'};
--
-- 	-- Autocompletion
-- 	{'hrsh7th/nvim-cmp'};
-- 	{'hrsh7th/cmp-buffer'};
-- 	{'hrsh7th/cmp-path'};
-- 	{'saadparwaiz1/cmp_luasnip'};
-- 	{'hrsh7th/cmp-nvim-lsp'};
-- 	{'hrsh7th/cmp-nvim-lua'};
--
-- 	-- Snippets
-- 	{'L3MON4D3/LuaSnip'};
-- 	{'rafamadriz/friendly-snippets'};
--
-- 	-- Lua Gui
-- 	{'ray-x/guihua.lua'};
--
-- 	-- Comments
-- 	{"terrortylor/nvim-comment"};
--
-- 	-- notify
-- 	{'rcarriga/nvim-notify'};
--
-- 	-- status line
-- 	{'nvim-lualine/lualine.nvim'};
--
-- 
-- 	{'ray-x/go.nvim'};
-- 	{'nvim-treesitter/nvim-treesitter'};
-- 	-- golang debug adapter
-- 	{'mfussenegger/nvim-dap'};
-- 	{"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}};
-- 	-- golang tests
-- 	{'buoto/gotests-vim'};
--
-- 	{'nvim-tree/nvim-web-devicons'}; -- optional, for file icons
-- 	{'nvim-tree/nvim-tree.lua'};
--
-- 	{'ibhagwan/fzf-lua'};
--
-- 	-- keymap
-- 	{'folke/which-key.nvim'};
-- }

-- LSP CONF
-- local lsp = require('lsp-zero')
--
-- lsp.preset('recommended')
-- lsp.ensure_installed({
--   'gopls',
-- })
-- lsp.nvim_workspace()
-- lsp.setup()

--- GO
require('go').setup()

-- Notify
require("notify").setup()

-- init keymap
require("which-key").setup {}
