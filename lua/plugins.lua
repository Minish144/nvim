return require('packer').startup(function()
	-- Packer itself
	use 'wbthomason/packer.nvim'

	-- Colortheme
    use 'arzg/vim-colors-xcode'
    
    -- Dev Icons
    use 'kyazdani42/nvim-web-devicons'

	-- Info bar
	use {
		'nvim-lualine/lualine.nvim',
    	requires = {'kyazdani42/nvim-web-devicons', opt = true},
    	config = function()
        	require('lualine').setup()
    	end, 
	}

	-- File manager
    use { 
		'kyazdani42/nvim-tree.lua',
    	requires = 'kyazdani42/nvim-web-devicons',
    	config = function()
			require('nvim-tree').setup() 
		end, 
	}

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
	use 'yuttie/comfortable-motion.vim'

    -- Window resizing
    use 'camspiers/animate.vim'
    use 'camspiers/lens.vim'

    -- Highlight other uses in file of word under cursor 
    use 'RRethy/vim-illuminate'

    -- Speed up loading lua modules
    use {
        'lewis6991/impatient.nvim',
        config = function()
			require('impatient')
		end,
    }

    -- Bufferline
    use {
        'akinsho/bufferline.nvim', 
        tag = "v2.*", 
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("bufferline").setup{}
    	end,    
    }

    -- COC
    use {
        'neoclide/coc.nvim', 
        branch = 'release'
    }

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter', 
        run = ":TSUpdate",
        event = { "BufRead", "BufNewFile" },
        cmd = {
            "TSInstall",
            "TSInstallInfo",
            "TSInstallSync",
            "TSUninstall",
            "TSUpdate",
            "TSUpdateSync",
            "TSDisableAll",
            "TSEnableAll",
        },
        config = function()
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
                    enable = true,
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
                    extended_mode = false,
                    max_file_lines = nil,
                },
                autotag = {
                    enable = true,
                },
            }
        end, 
    }

    -- Golang plugins
    use {
        'ray-x/go.nvim',
        config = function()
            require("go").setup()
            vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
            vim.cmd([[ autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 ]])
        end,
	}

    -- Snippet collection
    use {
        'rafamadriz/friendly-snippets',
        event = "InsertEnter" 
    }

    -- Snippets engine
    use {
        'L3MON4D3/LuaSnip',
        after = "friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    }

    -- Start screen
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }

    -- Code comments
    use {
        'numToStr/Comment.nvim',
        keys = { "gc", "gb", "g<", "g>" },
        config = function()
            require('Comment').setup()
        end
    }

     -- Keymaps popup
    use {
        'folke/which-key.nvim',
        config = function()
            require("which-key").setup()
        end,
    }
end)
