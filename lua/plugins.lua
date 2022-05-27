-- Cloning Packer if not installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
		'git', 'clone', '--depth', '1', 
		'https://github.com/wbthomason/packer.nvim', 
		install_path
	})
end

return require('packer').startup(function()
	-- Packer itself
	use 'wbthomason/packer.nvim'

	-- Colortheme
    use 'arcticicestudio/nord-vim'
    
	-- Info bar
	use {
		'nvim-lualine/lualine.nvim',
    	requires = {'kyazdani42/nvim-web-devicons', opt = true},
    	config = function()
        	require('lualine').setup()
    	end, 
	}
    
	-- File tabs
	use {
		'akinsho/bufferline.nvim', 
		requires = 'kyazdani42/nvim-web-devicons',
    	config = function()
        	require("bufferline").setup{}
    	end, 
	}

	-- File manager
    use { 
		'kyazdani42/nvim-tree.lua',
    	requires = 'kyazdani42/nvim-web-devicons',
    	config = function()
			require('nvim-tree').setup {} 
		end, 
	}

	-- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    
	-- Collection of configurations for built-in LSP client
    use { 
		'neovim/nvim-lspconfig',
		config = function()
			require('lspconfig').gopls.setup{}
		end,
	}
    
	-- Installer for LSPs
	use 'williamboman/nvim-lsp-installer'

	-- Smooth scroll
	use { 
		'karb94/neoscroll.nvim',
		config = function()
			require('neoscroll').setup()
		end,
	}	
end)
