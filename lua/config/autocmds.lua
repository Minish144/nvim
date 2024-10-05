local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

-- defx
cmd([[
    augroup DefxSettings
        autocmd!
        autocmd FileType defx setlocal cursorline
        autocmd FileType defx setlocal nonumber
        autocmd FileType defx setlocal norelativenumber
    augroup END
]])

-- undercurls
cmd([[let &t_Cs = "\e[4:3m"]])
cmd([[let &t_Ce = "\e[4:0m"]])

-- colorscheme
cmd([[colorscheme tokyonight]])

-- combine diagnostics
autocmd("CursorHold", {
	callback = function()
		local diagnostics = vim.diagnostic.get(0)
		local lines = {}

		for _, d in ipairs(diagnostics) do
			table.insert(lines, d.message)
		end

		if #lines > 0 then
			vim.api.nvim_echo({ { table.concat(lines, " | "), "WarningMsg" } }, false, {})
		end
	end,
})
