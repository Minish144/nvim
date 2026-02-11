return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		cmd = "Mason",
		opts = {
			max_concurrent_installers = 10,
			ensure_installed = {
				"lua-language-server",
				"gopls",
				"stylua",
				"shellcheck",
				"tailwindcss-language-server",
				"typescript-language-server",
				"css-lsp",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mason_registry = require("mason-registry")

			-- Ensure that all tools in ensure_installed are installed
			for _, tool in ipairs(opts.ensure_installed) do
				local package = mason_registry.get_package(tool)
				if not package:is_installed() then
					package:install()
				end
			end

			-- Uninstall any tool not in the ensure_installed list
			for _, package in ipairs(mason_registry.get_installed_packages()) do
				if not vim.tbl_contains(opts.ensure_installed, package.name) then
					package:uninstall()
				end
			end
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre", -- Lazy load on reading a buffer
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
		opts = {
			automatic_installation = true,
			automatic_enable = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LSPInfo", "LspInstall", "LspUninstall" },
		config = function()
			-- Setup LSP servers
			local mason_lspconfig = require("mason-lspconfig")

			-- Setup cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
				if server ~= "gopls" then
					vim.lsp.config(server, {
						capabilities = capabilities,
					})
				end
			end

			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			})

			for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
				vim.lsp.enable(server)
			end
		end,
	},
}
