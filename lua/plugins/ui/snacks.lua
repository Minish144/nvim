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
					duration = { step = 12, total = 190 },
					easing = "linear",
				},
				-- faster animation when repeating scroll after delay
				animate_repeat = {
					delay = 100, -- delay in ms before using the repeat animation
					duration = { step = 4, total = 35 },
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
