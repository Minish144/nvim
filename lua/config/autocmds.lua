-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
    augroup DefxSettings
        autocmd!
        autocmd FileType defx setlocal cursorline
        autocmd FileType defx setlocal nonumber
        autocmd FileType defx setlocal norelativenumber
    augroup END
]])
