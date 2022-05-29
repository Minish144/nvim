local g = vim.g
local fn = vim.fn

vim.cmd([[
augroup group1
    autocmd!
    autocmd FileType yaml,json setlocal shiftwidth=2 softtabstop=2 tabstop=2
    autocmd BufWritePre *.py,*.go,*.json,*.yml,*.yaml :silent! call CocAction('format')
    autocmd BufWritePre *.go,*.py :silent! call CocAction('runCommand', 'editor.action.organizeImport')
augroup END
]])

-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.CocSmartTab()', {expr = true, noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', ':call v:lua.CocShowDocumentation()<CR>', {noremap = true, silent = true})

vim.cmd([[
    command! -nargs=0 Format :call CocActionAsync('format')
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
]])

-- Functions

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

g.coc_snippet_next = '<tab>'

local function check_back_space()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end

function CocSmartTab()
  if fn.pumvisible() == 1 then
    return termcodes('<C-n>')
  elseif fn['coc#expandableOrJumpable']() == 1 then
    return termcodes('<C-r>') .. [[=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])]] .. termcodes('<CR>')
  else
    local status, result = pcall(check_back_space)
    if status and result then
      return termcodes('<Tab>')
    else
      return fn['coc#refresh()']()
    end
  end
end

function CocShowDocumentation()
  if fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
    vim.cmd('h ' .. fn.expand('<cword>'))
  elseif fn['coc#rpc#ready']() then
    fn.CocActionAsync('doHover')
  else
    vim.cmd('!' .. vim.o.keywordprg .. ' ' .. fn.expand('<cword>'))
  end
end


