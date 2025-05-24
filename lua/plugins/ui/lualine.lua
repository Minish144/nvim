return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "tpope/vim-fugitive", "nvim-tree/nvim-web-devicons" }, -- Add fugitive and icons
		event = "VeryLazy", -- Lazy load when needed
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight", -- Set the theme you like
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					icons_enabled = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" }, -- Information about branch and diffs
					lualine_c = {
						{
							"filename",
							file_status = true, -- Show file status (like [+] for modified files)
							path = 1, -- Show relative path
						},
						{
							"fugitive", -- Add information from fugitive
							icon = "", -- Icon for the branch
						},
					},
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = {},
			})
		end,
	},
}
