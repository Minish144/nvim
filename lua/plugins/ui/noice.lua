return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
			{ "rcarriga/nvim-notify" },
		},
		config = function()
			require("noice").setup({
				lsp = {
					progress = {
						enabled = false, -- Отключаем прогресс от LSP
					},
					override = {
						-- Отключаем все уведомления от LSP (включая ошибки и предупреждения)
						["vim.lsp.util.show_line_diagnostics"] = false,
						["vim.lsp.util.show_message"] = false,
						["vim.lsp.handlers.show_message"] = false,
					},
					hover = {
						enabled = true,
						opts = {
							border = {
								style = "rounded", -- Rounded corners for the hover window
							},
							win_options = {
								winblend = 0, -- Transparency for a better visual effect
							},
						},
					},
					signature = {
						enabled = true,
						auto_open = { enabled = false },
						opts = {
							border = {
								style = "rounded",
							},
							win_options = {
								winblend = 0,
							},
						},
					},
				},
				presets = {
					bottom_search = true, -- Use a classic bottom search bar
					command_palette = true, -- Position command palette at the bottom
					long_message_to_split = true, -- Long messages will be split into a separate window
				},
			})
		end,
	},
}
