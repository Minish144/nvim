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
						enabled = false, -- Disable LSP progress messages
					},
					override = {
						-- Disable all LSP notifications (including errors and warnings)
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
								winblend = 0, -- Transparency for better visual effect
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
					command_palette = true, -- Place command palette at the bottom
					long_message_to_split = true, -- Long messages will be split into a separate window
				},
			})
		end,
	},
}
