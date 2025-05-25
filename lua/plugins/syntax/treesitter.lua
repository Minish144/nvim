local ensure_installed = {
	"lua",
	"go",
	"json",
	"bash",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = ensure_installed,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = false,
			},
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = ensure_installed,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
			})
		end,
	},
}
