require'nvim-treesitter.configs'.setup {
    ensure_installed = "go", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = {}, -- List of parsers to ignore installing
    highlight = {
        enable = true,              -- false will disable the whole extension
        disable = {},  -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}


--vim.g:go_highlight_types(1);
--vim.g:go_highlight_fields: 1
--vim.g:go_highlight_functions: 1
--vim.g:go_highlight_function_calls: 1
--vim.g:go_highlight_extra_types: 1
--vim.g:go_highlight_operators: 1
