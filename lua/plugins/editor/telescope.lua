return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					prompt_prefix = "🔍 ",
					selection_caret = " ",
					initial_mode = "insert",
					path_display = function(_, path)
						local tail = require("telescope.utils").path_tail(path)
						local dirname = vim.fn.fnamemodify(path, ":h:t")
						return string.format("%s/%s", dirname, tail)
					end,
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
						horizontal = {
							preview_width = 0.6,
						},
					},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next, -- Move to next item
							["<C-k>"] = actions.move_selection_previous, -- Move to previous item
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- Send results to quickfix
							["<esc>"] = actions.close, -- Close Telescope in insert mode
						},
						n = {
							["q"] = actions.close, -- Close Telescope in normal mode
						},
					},
					file_ignore_patterns = { "node_modules", ".git/" }, -- Ignore specific folders
					winblend = 0, -- Add some transparency to the telescope window
				},
				pickers = {
					find_files = {
						hidden = true, -- Show hidden files
					},
					buffers = {
						sort_mru = true, -- Sort by most recently used buffers
						ignore_current_buffer = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- Enable fuzzy searching
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case", -- Use case sensitivity based on input
					},
				},
			})

			-- Load Telescope extensions
			telescope.load_extension("fzf")
		end,
	},
}
