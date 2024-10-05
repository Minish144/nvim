return {
	"kessejones/git-blame-line.nvim",
	opts = {
		git = {
			default_message = "Not committed yet",
			blame_format = "%an - %ar - %s", -- see https://git-scm.com/docs/pretty-formats
		},
		view = {
			left_padding_size = 3,
			enable_cursor_hold = false,
		},
	},
}
