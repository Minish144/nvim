local wilder = require('wilder')

wilder.setup{
	modes = {':', '/', '?'},
	next_key = '<Tab>',
    previous_key = '<S-Tab>',
    accept_key = '<Down>',
    reject_key = '<Up>',
}

-- wilder.set_option("renderer", wilder.popupmenu_renderer({
-- 	highlights = {
-- 		default = "WilderMenu",
-- 		accent = "WilderAccent",
-- 		border = "Normal" -- highlight to use for the border
-- 	},
-- 	border = "rounded",
--     -- highlighter = wilder.basic_highlighter(),
--     left = {" "},
--     right = {" ", wilder.popupmenu_scrollbar({thumb_char = " "})},
-- }))
--
wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		highlights = {
			default = "WilderMenu",
			accent = "WilderAccent",
			border = "Normal" -- highlight to use for the border
		},
		-- 'single', 'double', 'rounded' or 'solid'
		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
		border = "rounded",
		left = { " ", wilder.popupmenu_devicons() },
		right = { " ", wilder.popupmenu_scrollbar() },
	}))
)
