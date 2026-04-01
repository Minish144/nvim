return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 100,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup()

			require("nvim-treesitter").install({
				"lua",
				"go",
				"json",
				"bash",
			})

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local max_filesize = 100 * 1024
					local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
					if ok and stats and stats.size > max_filesize then
						return
					end
					pcall(vim.treesitter.start, args.buf)
				end,
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
