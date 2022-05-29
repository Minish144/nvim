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

    -- Lua functions module
    use 'nvim-lua/plenary.nvim'

    -- UI component library
    use 'MunifTanjim/nui.nvim'

    -- File Manager
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        },
        config = function()
            require("configs.neo-tree")
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
        end,
    }

    -- Highlight other uses in file of word under cursor
    use 'rrethy/vim-illuminate'

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

    -- Tokyo Night Theme
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

end)
