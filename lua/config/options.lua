local g = vim.g
local o = vim.opt

-- General
o.smoothscroll = true
g.mapleader = " "
o.fillchars = "eob: "
o.undofile = true
o.cursorline = true
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.number = true
o.relativenumber = true
o.title = true
o.autoindent = true
o.smartindent = true
o.hlsearch = true
o.backup = false
o.showcmd = true
o.cmdheight = 1
o.laststatus = 3
o.shell = "zsh"
o.backupskip = { "/tmp/*", "/private/tmp/*" }
o.inccommand = "split"
o.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
o.smarttab = true
o.breakindent = true
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.tabstop = 4
o.wrap = false -- No Wrap lines
o.backspace = { "start", "eol", "indent" }
o.path:append({ "**" }) -- Finding files - Search down into subfolders
o.wildignore:append({ "*/node_modules/*" })
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current
o.splitkeep = "cursor"
o.clipboard = "unnamedplus" -- Use the system clipboard for all copy and paste operations
o.swapfile = false
o.signcolumn = "yes"
g.netrw_banner = 0

-- Themes
o.termguicolors = true
o.listchars = {
	tab = "> ",
	trail = " ",
	nbsp = "+",
}

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

-- Diagnostics
vim.diagnostic.config({
	update_in_insert = false,
	virtual_text = {
		prefix = "",
		format = function(diagnostic)
			if diagnostic.severity == vim.diagnostic.severity.WARN then
				return string.format("(%s) %s", diagnostic.source, diagnostic.message)
			else
				return diagnostic.message
			end
		end,
	},
	signs = true,
	underline = true,
	severity_sort = true,
})

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
