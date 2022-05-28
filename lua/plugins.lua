return require('packer').startup(function()
	-- Packer itself
	use 'wbthomason/packer.nvim'

    -- Dev Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Tabs
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup{}
        end,
    }

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
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
            vim.fn.sign_define("DiagnosticSignWarn",  {text = " ", texthl = "DiagnosticSignWarn"})
            vim.fn.sign_define("DiagnosticSignInfo",  {text = " ", texthl = "DiagnosticSignInfo"})
            vim.fn.sign_define("DiagnosticSignHint",  {text = "", texthl = "DiagnosticSignHint"})
            require("neo-tree").setup()
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

    -- Highlight other uses in file of word under cursor
    use 'RRethy/vim-illuminate'

    -- Speed up loading lua modules
    use {
        'lewis6991/impatient.nvim',
        config = function()
			require('impatient')
		end,
    }

    -- coc
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

    -- Tokyo Night Theme
    use {
        'ghifarit53/tokyonight-vim',
        config = function()
            vim.cmd([[ let g:tokyonight_style = 'night' ]])
            vim.cmd([[ let g:tokyonight_enable_italic = 1 ]])
        end,
    }

    -- Trailting white red highlight
    use 'bronson/vim-trailing-whitespace'

    -- Auto closing pair brackets
    use 'jiangmiao/auto-pairs'
end)
