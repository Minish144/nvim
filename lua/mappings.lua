local map = vim.keymap.set
local bufmap = vim.api.nvim_buf_set_keymap

-- Leader
vim.g.mapleader = " "

-- Disabling arrows keys
-- map('', '<up>', ':echoe "Use k"<CR>', {noremap = true, silent = false})
-- map('', '<down>', ':echoe "Use j"<CR>', {noremap = true, silent = false})
-- map('', '<left>', ':echoe "Use h"<CR>', {noremap = true, silent = false})
-- map('', '<right>', ':echoe "Use l"<CR>', {noremap = true, silent = false})

-- Standard operations
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
map("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
map("n", "<C-q>", "<cmd>q!<cr>", { desc = "Force quit" })
map("n", "Q", "<Nop>")

-- Delete without saving to clipboard
map('n', 'd', '"_d')
map('x', 'd', '"_d')

-- Scrolling with mouse wheel
map("", "<ScrollWheelUp>", "<up>")
map("", "<ScrollWheelDown>", "<down>")

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Unindent line" })
map("v", ">", ">gv", { desc = "Indent line" })

-- Improved Terminal Mappings
map("t", "<esc>", "<C-\\><C-n>", { desc = "Terminal normal mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Terminal normal mode" })
map("t", "<C-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window navigation" })
map("t", "<C-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal down window navigation" })
map("t", "<C-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal up window navigation" })
map("t", "<C-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window naviation" })

-- File Explprer
map("n", "<leader>e", "<cmd>CocCommand explorer<cr>", { desc = "Toggle Explorer" })

-- COC
map('i', '<TAB>',
  function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
  end,
  { expr = true, noremap = true }
)
map('i', '<CR>',
  function()
    return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
  end,
  { noremap = true, expr = true }
)
map('n', 'g[', '<Plug>(coc-diagnostic-prev)', { silent = true, desc = "[Coc] Diagnostics Prev" })
map('n', 'g]', '<Plug>(coc-diagnostic-next)', { silent = true, desc = "[Coc] Diagnostics Next" })
map('n', 'gd', '<Plug>(coc-definition)', { silent = true, desc = "[Coc] Defenition" })
map('n', 'gy', '<Plug>(coc-type-definition)', { silent = true, desc = "[Coc] Type Defenition" })
map('n', 'gi', '<Plug>(coc-implementation)', { silent = true, desc = "[Coc] Implementation" })
map('n', 'gr', '<Plug>(coc-references)', { silent = true, desc = "[Coc] References" })
map('n', 'rn', '<Plug>(coc-rename)', { silent = true, desc = "[Coc] Rename" })
map('x','<leader>f','<Plug>(coc-format-selected)', { silent = true, desc = "[Coc] Format Selected" })
map('n','<leader>f','<Plug>(coc-format-selected)', { silent = true, desc = "[Coc] Format Selected" })
map('n','<leader>cd','<cmd>CocDiagnostics<cr>', { silent = true, desc = "[Coc] Diagnostics" })
map('n','<leader>ga','<cmd>CocAction<cr>', { silent = true, desc = "[Coc] Action" })
map('x', '<C-s>', '<Plug>(coc-range-select)', { silent = true, desc = "[Coc] Range Select" })
map('n', '<C-s>', '<Plug>(coc-range-select)', { silent = true, desc = "[Coc] Range Select" })

-- map('n', '<space>a',':<C-u>CocList diagnostics<CR>', {silent = true, nowait = true})
-- map('n', '<space>e',':<C-u>CocList extensions<CR>', {silent = true, nowait = true})
-- map('n', '<space>c',':<C-u>CocList commands<CR>', {silent = true, nowait = true})
-- map('n', '<space>o',':<C-u>CocList outline<CR>', {silent = true, nowait = true})
-- map('n', '<space>s',':<C-u>CocList -I symbols<CR>', {silent = true, nowait = true})
-- map('n', '<space>j', ':<C-u>CocNext<CR>', {silent = true, nowait = true})
-- map('n', '<space>k', ':<C-u>CocPrev<CR>', {silent = true, nowait = true})
-- map('n', '<space>p', ':<C-u>CocListResume<CR> ', {silent = true, nowait = true})

-- FZF
map('n', '<leader>ff', '<cmd>Files<cr>', { silent = true, desc = "[fzf] Find Files" })
map('n', '<leader>Rg', '<cmd>Rg<cr>', { silent = true, desc = "[fzf] Find Files" })
map('n', '<leader>Bl', '<cmd>BLines<cr>', { silent = true, desc = "[fzf] Find Files" })
map('n', '<leader>fb', '<cmd>Buffers<cr>', { silent = true, desc = "[fzf] Find Files" })
map('n', '<leader>fv', [[<cmd>call fzf#run({'options': '--reverse --prompt "> "', 'down': 20, 'dir': '/', 'sink': 'e' })<cr>]], { silent = true, desc = "[fzf] Find files from root" })

-- Defx
map('n', '<C-e>', '<cmd>Defx -split=floating -toggle<CR> ',  { silent = true, desc = "[defx] toggle explorer" })

function DefxMapping()
    local opt = { noremap = true, silent = true, expr = true }

    bufmap(0, 'n', '<cr>',  "defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('multi', ['quit', 'drop'])", opt)
    bufmap(0, 'n', 'l', [=[
        defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('multi', [['open', 'choose'], 'quit'])
    ]=], opt)
    bufmap(0, 'n', 'yy',    "defx#do_action('multi', ['copy', 'redraw'])", opt)
    bufmap(0, 'n', 'yc',    "defx#do_action('multi', ['clear_clipboard', 'redraw'])", opt)
    bufmap(0, 'n', 'mv',    "defx#do_action('move')", opt)
    bufmap(0, 'n', 'p',     "defx#do_action('paste')", opt)
    bufmap(0, 'n', '<c-v>', "defx#do_action('open', 'vsplit)", opt)
    bufmap(0, 'n', '<c-h>', "defx#do_action('open', 'split)", opt)
    bufmap(0, 'n', '<c-p>', "defx#do_action('open', 'pedit')", opt)
    bufmap(0, 'n', 'P',     "defx#do_action('preview')", opt)
    bufmap(0, 'n', 'o',     "defx#do_action('open_tree', 'toggle')", opt)
    bufmap(0, 'n', 'O',     "defx#do_action('open_tree', ['toggle', 'recursive'])", opt)
    bufmap(0, 'n', 'a',     "defx#do_action('new_file')", opt)
    bufmap(0, 'n', 'A',     "defx#do_action('new_directory')", opt)
    bufmap(0, 'n', 'r',     "defx#do_action('rename')", opt)
    bufmap(0, 'n', 'yp',    "defx#do_action('yank_path')", opt)
    bufmap(0, 'n', 'dt',    "defx#do_action('remove_trash')", opt)
    bufmap(0, 'n', 'df',    "defx#do_action('remove')", opt)
    bufmap(0, 'n', '<bs>',  "defx#do_action('cd', ['..'])", opt)
    bufmap(0, 'n', '~',     "defx#do_action('cd')", opt)
    bufmap(0, 'n', 'q',     "defx#do_action('quit')", opt)
    bufmap(0, 'n', '<c-k>', "defx#do_action('toggle_select') . 'k'", opt)
    bufmap(0, 'n', '<c-j>', "defx#do_action('toggle_select') . 'j'", opt)
    bufmap(0, 'n', 'v', "defx#do_action('toggle_select')", opt)
    bufmap(0, 'n', 'V',     "defx#do_action('toggle_select_all')", opt)
    -- bufmap(0, 'n', 'j',     "line('.') == line('$') ? 'gg' : 'j'", opt)
    -- bufmap(0, 'n', 'k',     "line('.') == 1 ? 'G' : 'k'", opt)
    bufmap(0, 'n', 'H',     "defx#do_action('toggle_ignored_files')", opt)
    bufmap(0, 'n', '<c-g>', "defx#do_action('print')", opt)
    bufmap(0, 'n', 'R',     "defx#do_action('redraw')", opt)
    bufmap(0, 'n', ';',     "defx#do_action('repeat')", opt)
    bufmap(0, 'n', '!',     "defx#do_action('execute_command')", opt)
    bufmap(0, 'n', 'cd',    "defx#do_action('change_vim_cwd')", opt)
end

vim.cmd('autocmd FileType defx call v:lua.DefxMapping()')

-- Searchbox
map('n', '<leader>ss', '<cmd>SearchBoxIncSearch<cr>', {noremap = true, silent = true, desc = "[SearchBox] IncSearch"})
map('n', '<leader>sr', '<cmd>SearchBoxReplace<cr>', {noremap = true, silent = true, desc = "[SearchBox] Replace"})

-- COC
vim.cmd([[inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]])
