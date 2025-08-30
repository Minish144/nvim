return {
	"ellisonleao/dotenv.nvim",
	lazy = false,
	priority = 9999,
	opts = {},
	config = function()
		require("dotenv").setup({
			enable_on_load = true, -- will load your .env file upon loading a buffer
			verbose = false, -- show error notification if .env file is not found and if .env is loaded
		})

		local config_dir = vim.fn.stdpath("config")
		local env_file = config_dir .. "/.env"

		vim.cmd("Dotenv " .. vim.fn.fnameescape(env_file))
	end,
}
