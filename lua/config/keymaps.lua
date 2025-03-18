local map = vim.keymap.set
local bufmap = vim.api.nvim_buf_set_keymap

-- Telescope
map("n", "gd", function()
	require("telescope.builtin").lsp_definitions({ reuse_win = true })
end, { desc = "Goto Definition" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References", nowait = true })
map("n", "gI", function()
	require("telescope.builtin").lsp_implementations({ reuse_win = true })
end, { desc = "Goto Implementation" })
map("n", "gy", function()
	require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
end, { desc = "Goto Type Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "<leader>/", "<Cmd>Telescope live_grep<CR>", { desc = "Grep (root dir)" })

-- LSP
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
-- map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
map("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

-- Clipboard
map("v", "p", "P")
map("n", "d", '"_d')
map("x", "d", '"_d')

-- Highlight
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })

-- Scrolling with mouse wheel
map("", "<ScrollWheelUp>", "<up>")
map("", "<ScrollWheelDown>", "<down>")

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Unindent line" })
map("v", ">", ">gv", { desc = "Indent line" })

-- Defx
map(
	"n",
	"<C-e>",
	"<cmd>Defx -split=floating -toggle<CR> ",
	{ silent = true, desc = "[defx] toggle explorer", nowait = true }
)

function DefxMapping()
	local opt = { noremap = true, silent = true, expr = true }

	bufmap(
		0,
		"n",
		"<cr>",
		"defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('multi', ['quit', 'drop'])",
		opt
	)
	bufmap(
		0,
		"n",
		"l",
		[=[
        defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('multi', [['open', 'choose'], 'quit'])
    ]=],
		opt
	)
	bufmap(0, "n", "yy", "defx#do_action('multi', ['copy', 'redraw'])", opt)
	bufmap(0, "n", "yc", "defx#do_action('multi', ['clear_clipboard', 'redraw'])", opt)
	bufmap(0, "n", "mv", "defx#do_action('move')", opt)
	bufmap(0, "n", "p", "defx#do_action('paste')", opt)
	bufmap(0, "n", "<c-v>", "defx#do_action('open', 'vsplit)", opt)
	bufmap(0, "n", "<c-h>", "defx#do_action('open', 'split)", opt)
	bufmap(0, "n", "<c-p>", "defx#do_action('open', 'pedit')", opt)
	bufmap(0, "n", "P", "defx#do_action('preview')", opt)
	bufmap(0, "n", "o", "defx#do_action('open_tree', 'toggle')", opt)
	bufmap(0, "n", "O", "defx#do_action('open_tree', ['toggle', 'recursive'])", opt)
	bufmap(0, "n", "a", "defx#do_action('new_file')", opt)
	bufmap(0, "n", "A", "defx#do_action('new_directory')", opt)
	bufmap(0, "n", "r", "defx#do_action('rename')", opt)
	bufmap(0, "n", "yp", "defx#do_action('yank_path')", opt)
	bufmap(0, "n", "dt", "defx#do_action('remove_trash')", opt)
	bufmap(0, "n", "df", "defx#do_action('remove')", opt)
	bufmap(0, "n", "<bs>", "defx#do_action('cd', ['..'])", opt)
	bufmap(0, "n", "~", "defx#do_action('cd')", opt)
	bufmap(0, "n", "q", "defx#do_action('quit')", opt)
	bufmap(0, "n", "<c-k>", "defx#do_action('toggle_select') . 'k'", opt)
	bufmap(0, "n", "<c-j>", "defx#do_action('toggle_select') . 'j'", opt)
	bufmap(0, "n", "v", "defx#do_action('toggle_select')", opt)
	bufmap(0, "n", "V", "defx#do_action('toggle_select_all')", opt)
	-- bufmap(0, 'n', 'j',     "line('.') == line('$') ? 'gg' : 'j'", opt)
	-- bufmap(0, 'n', 'k',     "line('.') == 1 ? 'G' : 'k'", opt)
	bufmap(0, "n", "H", "defx#do_action('toggle_ignored_files')", opt)
	bufmap(0, "n", "<c-g>", "defx#do_action('print')", opt)
	bufmap(0, "n", "R", "defx#do_action('redraw')", opt)
	bufmap(0, "n", ";", "defx#do_action('repeat')", opt)
	bufmap(0, "n", "!", "defx#do_action('execute_command')", opt)
	bufmap(0, "n", "cd", "defx#do_action('change_vim_cwd')", opt)
end

vim.cmd("autocmd FileType defx call v:lua.DefxMapping()")

-- Buffers
local telescope_open = false

map("n", "<C-w>", function()
	if telescope_open then
		vim.cmd("stopinsert")
		vim.api.nvim_input("<Esc>")
		telescope_open = false
	else
		require("telescope.builtin").buffers({
			ignore_current_buffer = false,
			show_all_buffers = true,
			sort_mru = true,
			attach_mappings = function(_, m)
				m("i", "<C-w>", function()
					vim.cmd("stopinsert")
					vim.api.nvim_input("<Esc>")
					telescope_open = false
				end)
				return true
			end,
		})
		telescope_open = true

		vim.api.nvim_create_autocmd("WinClosed", {
			callback = function()
				telescope_open = false
			end,
			once = true,
		})
	end
end, { desc = "Buffers", nowait = true })

-- Git Blame
map("n", "<leader>Rb", "<cmd>GitBlameLineToggle<cr>", { silent = true, desc = "Git Blame Line", nowait = true })

-- Diagnostics
map("n", "[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN, float = false })
end, { desc = "Go to previous warning" })

map("n", "]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN, float = false })
end, { desc = "Go to next warning" })

map("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, float = false })
end, { desc = "Go to previous error" })

map("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, float = false })
end, { desc = "Go to next error" })
