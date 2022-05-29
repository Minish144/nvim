local cmd = vim.cmd
local fn = vim.fn

-- Packer autoinstall
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
		'git', 'clone', '--depth', '1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
end

-- Main Vim settings
vim.cmd('set termguicolors')        -- term gui colors
vim.cmd('set colorcolumn=120')  	-- colorcolumn
vim.cmd('set relativenumber')       -- relative numbers
vim.cmd('set encoding=utf8')		-- encoding
vim.cmd('set nu!')			        -- line numbers
vim.cmd('set mouse=a')          	-- enabling mouse
vim.cmd('set wildmenu')         	-- commandline completion
vim.cmd('set incsearch')        	-- incsearch
vim.cmd('set title')            	-- tab title
vim.cmd('set shiftwidth=4')     	-- tab width
vim.cmd('set softtabstop=4')    	-- spaces on tab
vim.cmd('set tabstop=4')        	-- spaces on tab
vim.cmd('set smarttab')         	-- shifwidth
vim.cmd('set expandtab')        	-- indents on > and <
vim.cmd('set smartindent')      	-- smart indents
vim.cmd('set clipboard=unnamedplus')-- system clipboard
vim.cmd('set nowrap')               -- disable line wrapping
vim.cmd('set signcolumn=yes')       -- signcolumn
vim.cmd('set shortmess+=c')         -- dont pass messages to |ins-completion-menu|
vim.cmd('set updatetime=300')       -- updatetime
-- vim.cmd('set cmdheight=2')       -- more space for displaying messages
vim.cmd('set hidden')               -- textedit might fall if hidden is not set
vim.cmd('set nobackup')             -- some lsps have troubles with backup files
vim.cmd('set nowritebackup')
vim.cmd('set noshowmode')           -- disables mode showing

-- Tabulation settings
cmd('au BufEnter * set fo-=c fo-=r fo-=o')

-- Trailing whitepsaces auto removal
cmd([[ autocmd BufWritePre * :%s/\s\+$//e ]])

-- GUI Colors
cmd('set termguicolors')
vim.cmd('set cursorline')           -- highlighting cursorline
-- vim.cmd('set cursorlineopt=number')
vim.cmd([[
    autocmd!
    autocmd ColorScheme * highlight CursorLineNr ctermfg=6 guifg=#81A1C1
]])

