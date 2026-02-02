return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				go = {
					"gofmt",
					"goimports",
				},
				lua = {
					"stylua",
				},
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				conform.format({
					lsp_format = "fallback",
					bufnr = args.buf,
					async = false,
					timeout_ms = 2000,
				})
			end,
		})
	end,
}
