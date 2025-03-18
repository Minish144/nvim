return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				go = {
					"goimports",
					"gofmt",
				},
				lua = {
					"stylua",
				},
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				conform.format({
					bufnr = args.buf,
					async = false,
				})
			end,
		})
	end,
}
