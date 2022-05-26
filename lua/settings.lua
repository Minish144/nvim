local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g   
local opt = vim.opt   

-- Main
opt.colorcolumn = '120' 
opt.number = true
opt.relativenumber = true

-- Tabulation
cmd([[
    filetype indent plugin on
    syntax enable
]])

cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Theme
cmd'colorscheme onedark'

