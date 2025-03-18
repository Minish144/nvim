return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				go = { "golangci_lint" },
			}

			lint.linters.golangci_lint = {
				cmd = "golangci-lint",
				args = { "run", "--out-format", "line-number", "%filepath" },
				stdin = false,
				stream = "stdout",
				ignore_exitcode = true,
				parser = require("lint.parser").from_pattern(
					[[(%d+):(%d+): (%w+): (.+)]],
					{ "lnum", "col", "severity", "message" },
					{
						source = "golangci-lint",
						severity = {
							["error"] = vim.diagnostic.severity.ERROR,
							["warning"] = vim.diagnostic.severity.WARN,
							["info"] = vim.diagnostic.severity.INFO,
						},
					}
				),
			}

			-- Debounce lint timer
			local lint_timer = vim.loop.new_timer()

			vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
				callback = function()
					lint_timer:stop()
					lint_timer:start(
						100,
						0,
						vim.schedule_wrap(function()
							lint.try_lint()
						end)
					)
				end,
			})

			-- Autolint on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
