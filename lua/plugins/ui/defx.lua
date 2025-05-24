return {
	{
		"Shougo/defx.nvim",
		lazy = false,
		dependencies = {
			"kristijanhusak/defx-icons",
			"kristijanhusak/defx-git",
		},
		run = ":UpdateRemotePlugins",
		config = function()
			local fn = vim.fn

			fn["defx#custom#option"]("_", {
				winwidth = 95,
				winheight = 20,
				split = "floating",
				show_ignored_files = true,
				buffer_name = "defx",
				resume = true,
				listed = true,
				columns = "git:indent:icons:filename:mark:size:time",
			})

			fn["defx#custom#column"]("indent", {
				indent = "  ",
			})

			fn["defx#custom#column"]("git", "indicators", {
				Modified = "M",
				Staged = "S",
				Untracked = "U",
				Renamed = "R",
				Unmerged = "═",
				Ignored = "I",
				Deleted = "D",
				Unknown = "?",
			})

			fn["defx#custom#column"]("icon", {
				directory_icon = "▸",
				opened_icon = "▾",
				root_icon = " ",
			})

			fn["defx#custom#column"]("filename", {
				min_width = 64,
				max_width = 128,
			})

			fn["defx#custom#column"]("mark", {
				readonly_icon = "✗",
				selected_icon = "✓",
			})
		end,
	},
}
