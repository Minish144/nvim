vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = '*/megamarket/*',
    command = "Copilot disable"
})
