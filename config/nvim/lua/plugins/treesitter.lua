require'nvim-treesitter.configs'.setup {
	ensure_installed = {"go", "yaml", "toml", "gomod" },
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = {}, -- List of parsers to ignore installing

	highlight = {
        enable = true,              -- false will disable the whole extension
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},

	context_commentstring = {
		enable = true
	}

}
