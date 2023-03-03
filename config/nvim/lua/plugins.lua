return require('packer').startup(function(use)

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-----------------------CORE---------------------
	
	-- Let Paq manage itself
	use "savq/paq-nvim"
	
	-- Use braces when passing Options
	use {"lervag/vimtex", opt=true}
	
	-- notify
	use {'rcarriga/nvim-notify'}

	-----------------------LSP-----------------------
	
	-- Autocompletion
	use	{'hrsh7th/nvim-cmp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'saadparwaiz1/cmp_luasnip'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-nvim-lua'}

	-- Snippets
	use	{'L3MON4D3/LuaSnip'}
	use	{'rafamadriz/friendly-snippets'}

	-- Mason
	use { "williamboman/mason.nvim" }
	use {'williamboman/mason-lspconfig.nvim'}

	-- lsp config
	use {'neovim/nvim-lspconfig'}
	
	-- lsp zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'main',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
  }

	---------------------EDIT-----------------------
	
	-- auto pare braces
	use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
	
	-- Comments
	use {"terrortylor/nvim-comment"}

	---------------------FORMATER-------------------
	
	-- formater
	use { 'mhartington/formatter.nvim' }

    ------------------------NAVIGATE----------------

	use {'nvim-tree/nvim-tree.lua'};

	use {'ibhagwan/fzf-lua'};

	use {'RishabhRD/popfix'}
  use {'RishabhRD/nvim-lsputils'}

	-- keymap
	use {'folke/which-key.nvim'};

	-----------------------VIEW----------------------
    
	-- Colorschema
	use {'held-m/neovim-sand'}

	-- Lua Gui
	use {'ray-x/guihua.lua'}

	-- status line
	use {'nvim-lualine/lualine.nvim'}

	-- optional, for file icons
	use {'nvim-tree/nvim-web-devicons'}

	-- show colors
	use {'ap/vim-css-color'}

    -- golang highlights
    use {'nvim-treesitter/nvim-treesitter'}
	
end)
