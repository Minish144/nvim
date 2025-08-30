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
				provider = "openai_compatible",
				notify = "verbose", -- see more notifications
				request_timeout = 15, -- use 2 seconds for faster retrieval
				n_completions = 1,
				context_window = 2048,
				provider_options = {
					openai_compatible = {
						end_point = URL .. "/v1/chat/completions",
						api_key = function()
							return API_KEY
						end,
						stream = true,
						model = AUTOCOMPLETE_MODEL,
						name = "Personal",
						optional = {
							max_tokens = 4096,
						},
					},
				},
				virtualtext = {
					auto_trigger_ft = { "*" },
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
