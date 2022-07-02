local g = vim.g

vim.fn['defx#custom#option']('_', {
    winwidth = 95,
    winheight = 20,
    split= 'floating',
    show_ignored_files = 1,
    buffer_name = 'defx',
    resume = 1,
    columns = 'git:indent:icons:filename:mark:size:time',
})

vim.fn['defx#custom#column']('indent', {
    indent='  ',
})

vim.fn['defx#custom#column']('git', 'indicators', {
    Modified = 'M',
    Staged = 'S',
    Untracked = 'U',
    Renamed = 'R',
    Unmerged = '═',
    Ignored = 'I',
    Deleted = 'D',
    Unknown = '?',
})

vim.fn['defx#custom#column']('icon', {
    directory_icon = '▸',
    opened_icon = '▾',
    root_icon = ' ',
})

vim.fn['defx#custom#column']('filename', {
    min_width = 64,
    max_width = 128,
})

vim.fn['defx#custom#column']('mark', {
    readonly_icon = '✗',
    selected_icon = '✓',
})

vim.cmd([[
    augroup DefxSettings
        autocmd!
        autocmd FileType defx setlocal cursorline
        autocmd FileType defx setlocal nonumber
        autocmd FileType defx setlocal norelativenumber
    augroup END
]])

-- defx icons settings
g.defx_icons_enable_syntax_highlight = true
g.defx_icons_column_length = 2
g.defx_icons_directory_icon = ''
g.defx_icons_mark_icon = '﯂'
g.defx_icons_parent_icon = ''
g.defx_icons_root_opened_tree_icon = ''
g.defx_icons_default_icon = ''
g.defx_icons_directory_symlink_icon = ''
g.defx_icons_nested_opened_tree_icon = ''
