return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"lua",
				"go",
				"json",
				"bash",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = false,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- {
	-- 	"p00f/nvim-ts-rainbow",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	config = function()
	-- 		---@diagnostic disable-next-line: missing-fields
	-- 		require("nvim-treesitter.configs").setup({
	-- 			rainbow = {
	-- 				enable = true,
	-- 				extended_mode = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
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
