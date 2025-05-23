return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				go = { "golangcilint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("LintAutogroup", { clear = true })

			vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, { -- run lint on buffer read/write
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>cl", function() -- lint on hotkey SPACE + c + l
				lint.try_lint()
			end, { desc = "Lint current file" })

			vim.api.nvim_create_autocmd("InsertLeave", { -- run lint on insert leave
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
