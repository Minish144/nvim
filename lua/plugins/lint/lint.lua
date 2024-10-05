return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" }, -- Линтер загружается лениво при открытии файла
		config = function()
			local lint = require("lint")

			-- Настройка линтера golangci-lint для Go
			lint.linters_by_ft = {
				go = { "golangci_lint" },
			}

			-- Настраиваем golangci-lint
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

			-- Таймер для дебаунса линтинга
			local lint_timer = vim.loop.new_timer()

			-- Автолинтинг с дебаунсом
			vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
				callback = function()
					-- Сбрасываем таймер при каждом изменении
					lint_timer:stop()
					lint_timer:start(
						100, -- Время задержки в миллисекундах
						0, -- Выполнить один раз после задержки
						vim.schedule_wrap(function()
							lint.try_lint()
						end)
					)
				end,
			})

			-- Также линтим при сохранении файла
			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
