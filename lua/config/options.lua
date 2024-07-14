-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local o = vim.opt

-- Themes
o.termguicolors = true
o.listchars = {
  tab = "> ",
  trail = " ",
  nbsp = "+",
}

-- Leader
g.mapleader = " "

-- Defx icons settings
g.defx_icons_enable_syntax_highlight = true
g.defx_icons_column_length = 2
g.defx_icons_directory_icon = ""
g.defx_icons_mark_icon = "﯂"
g.defx_icons_parent_icon = ""
g.defx_icons_root_opened_tree_icon = ""
g.defx_icons_default_icon = ""
g.defx_icons_directory_symlink_icon = ""
g.defx_icons_nested_opened_tree_icon = ""
g.defx_icons_nested_closed_tree_icon = ""
