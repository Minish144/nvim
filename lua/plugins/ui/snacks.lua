-- header
local header = [[
███╗   ███╗██╗███╗   ██╗██╗███████╗██╗  ██╗ ██╗██╗  ██╗██╗  ██╗
████╗ ████║██║████╗  ██║██║██╔════╝██║  ██║███║██║  ██║██║  ██║
██╔████╔██║██║██╔██╗ ██║██║███████╗███████║╚██║███████║███████║
██║╚██╔╝██║██║██║╚██╗██║██║╚════██║██╔══██║ ██║╚════██║╚════██║
██║ ╚═╝ ██║██║██║ ╚████║██║███████║██║  ██║ ██║     ██║     ██║
╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚═╝  ╚═╝ ╚═╝     ╚═╝     ╚═╝
]]

return {
	{
		"folke/snacks.nvim",
		opts = {
			scroll = {
				enabled = true,
				animate = {
					duration = { step = 11, total = 160 },
					easing = "linear",
				},
				-- faster animation when repeating scroll after delay
				animate_repeat = {
					delay = 80, -- delay in ms before using the repeat animation
					duration = { step = 3, total = 33 },
					easing = "linear",
				},
				-- what buffers to animate
				filter = function(buf)
					return vim.g.snacks_scroll ~= false
						and vim.b[buf].snacks_scroll ~= false
						and vim.bo[buf].buftype ~= "terminal"
				end,
			},
			dashboard = {
				preset = {
					header = header,
				},
			},
		},
	},
}
