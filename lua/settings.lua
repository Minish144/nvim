local cmd = vim.cmd
local fn = vim.fn

-- Main Vim settings
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

-- Tabulation settings
cmd([[
    filetype indent plugin on
    syntax enable
]])
cmd('au BufEnter * set fo-=c fo-=r fo-=o')

-- Theme
cmd('colorscheme nord')

-- Packer autoinstall 
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
		'git', 'clone', '--depth', '1', 
		'https://github.com/wbthomason/packer.nvim', 
		install_path
	})
end

-- LSP settings
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "sumneko_lua" then
        -- only apply these settings for the "sumneko_lua" server
        opts.settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the 'vim', 'use' global
                    globals = {'vim', 'use'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    end
    server:setup(opts)
end)
