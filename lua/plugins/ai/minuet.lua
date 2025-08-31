return {
	{
		"milanglacier/minuet-ai.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		enabled = os.getenv("LLM_URL") ~= "",
		config = function()
			local API_KEY = os.getenv("LLM_API_KEY")
			local URL = os.getenv("LLM_URL")
			local AUTOCOMPLETE_MODEL = os.getenv("LLM_AUTOCOMPLETE_MODEL")

			require("minuet").setup({
				provider = "openai_fim_compatible",
				notify = "verbose", -- see more notifications
				request_timeout = 10,
				n_completions = 1,
				context_window = 128,
				throttle = 1000,
				debounce = 800,
				stream = true,
				provider_options = {
					openai_fim_compatible = {
						end_point = URL .. "/v1/completions",
						api_key = function()
							return API_KEY
						end,
						stream = true,
						model = AUTOCOMPLETE_MODEL,
						name = "Personal",
						optional = {
							max_tokens = 128,
							temperature = 0.1,
							top_p = 0.9,
						},
					},
				},
				virtualtext = {
					auto_trigger_ft = {
						-- universal
						"markdown",
						"text",
						"gitcommit",
						"gitrebase",
						-- web
						"html",
						"css",
						"scss",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
						"svelte",
						-- backend / system
						"python",
						"lua",
						"rust",
						"go",
						"c",
						"cpp",
						"java",
						"kotlin",
						"csharp",
						"php",
						"ruby",
						"perl",
						"swift",
						"zig",
						-- data / infra
						"sql",
						"json",
						"yaml",
						"toml",
						"xml",
						"dockerfile",
						"sh",
						"bash",
						"zsh",
						-- cfg / devops
						"make",
						"cmake",
						"terraform",
						"hcl",
					},
					keymap = {
						-- accept whole completion
						accept = "<C-CR>",
					},
				},
				-- help here please
			})
		end,
	},
}
