local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g   
local opt = vim.opt   

-- Main
opt.colorcolumn = '120' 
opt.number = true
opt.relativenumber = true

-- Tabulation
cmd([[
    filetype indent plugin on
    syntax enable
]])

cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Theme
cmd [[colorscheme nord]]

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
