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
			require('lspconfig').gopls.setup{
                on_attach = function(client)
                    require('illuminate').on_attach(client)
                end,
            }
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

    -- Window resizing
    use 'camspiers/animate.vim'
    use 'camspiers/lens.vim'

    -- Highlight other uses in file of word under cursor 
    use 'RRethy/vim-illuminate'
end)
