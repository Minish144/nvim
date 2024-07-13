local severities = {
  error = vim.diagnostic.severity.ERROR,
  warning = vim.diagnostic.severity.WARN,
  refactor = vim.diagnostic.severity.INFO,
  convention = vim.diagnostic.severity.HINT,
}

return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = {
        go = { "golangcilint" },
      }

      opts.linters = {
        golangcilint = {
          cmd = "golangci-lint",
          append_fname = false,
          args = {
            "run",
            "--out-format=json",
            "--print-issued-lines=false",
            "--print-linter-name=false",
            function()
              return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
            end,
          },

          parser = function(output, bufnr, cwd)
            if output == "" then
              return {}
            end

            local decoded = vim.json.decode(output)
            if decoded["Issues"] == nil or type(decoded["Issues"]) == "userdata" then
              return {}
            end

            local diagnostics = {}

            for _, item in ipairs(decoded["Issues"]) do
              if item.Pos and item.FromLinter ~= "typecheck" then
                table.insert(diagnostics, {
                  lnum = item.Pos.Line > 0 and item.Pos.Line - 1 or 0,
                  col = item.Pos.Column > 0 and item.Pos.Column - 1 or 0,
                  end_lnum = item.Pos.Line > 0 and item.Pos.Line - 1 or 0,
                  end_col = item.Pos.Column > 0 and item.Pos.Column - 1 or 0,
                  severity = severities[item.Severity] or severities.warning,
                  source = item.FromLinter,
                  message = item.Text,
                })
              end
            end

            return diagnostics
          end,
        },
      }

      return opts
    end,
  },
}
