return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 100,
		build = ":TSUpdate",
		branch = "master",
		opts = {
			ensure_installed = {
				"lua",
				"go",
				"json",
				"bash",
			},
			auto_install = false,
			highlight = {
				enable = true,
				disable = function(lang, buf)
					local max_filesize = 100 * 1024
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = false,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			local ts_install = require("nvim-treesitter.install")
			ts_install.prefer_git = false
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
