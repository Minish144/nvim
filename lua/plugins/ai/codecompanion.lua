return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			{ "ellisonleao/dotenv.nvim" },
			{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
			{ "nvim-lua/plenary.nvim" },
			{ "franco-ruggeri/codecompanion-spinner.nvim" },
			{ "ravitemer/mcphub.nvim" },
		},
		priority = 0,
		config = function()
			local API_KEY = os.getenv("LLM_API_KEY")
			local URL = os.getenv("LLM_URL")
			local COMPANION_MODEL = os.getenv("LLM_COMPANION_MODEL")

			if URL == "" or COMPANION_MODEL == "" then
				return {}
			end

			require("codecompanion").setup({
				adapters = {
					http = {
						personal = function()
							return require("codecompanion.adapters").extend("openai_compatible", {
								name = "personal",
								formatted_name = "Personal",
								schema = {
									model = {
										default = COMPANION_MODEL,
									},
								},
								env = {
									api_key = API_KEY,
									url = URL,
									chat_url = "/v1/chat/completions",
									models_endpoint = "/v1/models",
									model = COMPANION_MODEL,
								},
								headers = {
									["Content-Type"] = "application/json",
									["Authorization"] = "Bearer ${api_key}",
								},
							})
						end,
					},
				},
				display = {
					action_palette = {
						provider = "snacks",
					},
					chat = {
						start_in_insert_mode = true,
					},
				},
				strategies = {
					chat = {
						adapter = "personal",
					},
					inline = {
						adapter = "personal",
					},
					cmd = {
						adapter = "personal",
					},
				},
				extensions = {
					spinner = {},
					mcphub = {
						callback = "mcphub.extensions.codecompanion",
						opts = {
							-- MCP Tools
							make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
							show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
							add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
							show_result_in_chat = true, -- Show tool results directly in chat buffer
							format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
							-- MCP Resources
							make_vars = true, -- Convert MCP resources to #variables for prompts
							-- MCP Prompts
							make_slash_commands = true, -- Add MCP prompts as /slash commands
						},
					},
				},
			})
		end,
	},
}
