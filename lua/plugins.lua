return require('packer').startup(function()
	-- Packer itself
	use {
        'wbthomason/packer.nvim',
        config = function()
            require('configs.packer')
        end,
    }

    -- Dev Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Lua functions module
    use 'nvim-lua/plenary.nvim'

    -- UI component library
    use 'MunifTanjim/nui.nvim'

    -- Highlight other uses in file of word under cursor
    use {
        'rrethy/vim-illuminate',
        config = function()
            vim.g.Illuminate_highlightUnderCursor = 0
        end,
    }

    -- Speed up loading lua modules
    use {
        'lewis6991/impatient.nvim',
        config = function()
			require('impatient')
		end,
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
            require('configs.treesitter')
        end,
    }

    -- Code comments
    use {
        'numToStr/comment.nvim',
        keys = { "gc", "gb", "g<", "g>" },
        config = function()
            require('Comment').setup()
        end
    }

     -- Keymaps popup
    use {
        'folke/which-key.nvim',
        config = function()
            require("configs.which-key")
        end,
    }

    -- Theme
    use {
        'ghifarit53/tokyonight-vim',
        config = function()
            vim.cmd([[ let g:tokyonight_style = 'night' ]])
            vim.cmd([[ let g:tokyonight_enable_italic = 1 ]])
            vim.cmd('colorscheme tokyonight')
        end,
    }

    -- Trailting white red highlight
    use 'bronson/vim-trailing-whitespace'

    -- Auto closing pair brackets
    use 'jiangmiao/auto-pairs'

    -- Tabs
    use {
        'akinsho/bufferline.nvim',
        config = function()
            require("configs.bufferline")
        end,
    }

    -- COC
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            require('configs.coc')
        end,
    }

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
        config = function()
            require('gitsigns').setup()
        end,
    }
    use 'tpope/vim-fugitive'

    -- Bottom status line
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('configs.lualine')
        end,
    }

    -- Color has colorizer
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    }

    -- Fuzzy finder
    use { 'ibhagwan/fzf-lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
end)
