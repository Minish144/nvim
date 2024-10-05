return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "tpope/vim-fugitive", "nvim-tree/nvim-web-devicons" }, -- Добавляем fugitive и иконки
		event = "VeryLazy", -- Ленивая загрузка при необходимости
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight", -- Установи тему, которая тебе нравится
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					icons_enabled = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" }, -- Информация о ветке и разницах
					lualine_c = {
						{
							"filename",
							file_status = true, -- Показывать статус файла (например, [+] для модифицированного файла)
							path = 1, -- Отображать относительный путь
						},
						{
							"fugitive", -- Добавляем информацию от fugitive
							icon = "", -- Иконка для ветки
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
