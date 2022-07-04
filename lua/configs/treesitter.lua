 require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'go' },
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    autopairs = {
        enable = false,
    },
    incremental_selection = {
        enable = true,
    },
    indent = {
        enable = false,
    },
    rainbow = {
        enable = true,
        disable = { 'html' },
        extended_mode = true,
        max_file_lines = nil,
    },
    autotag = {
        enable = true,
    },
}
