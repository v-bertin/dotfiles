return {
	"milanglacier/minuet-ai.nvim",
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			model = "claude-sonnet-4.6", -- AI model to use
			temperature = 0.1, -- Lower = focused, higher = creative
			trusted_tools = nil, -- Require approval for all tool calls
			window = {
				layout = "vertical", -- 'vertical', 'horizontal', 'float'
				width = 0.5, -- 50% of screen width
			},
			auto_insert_mode = true, -- Enter insert mode when opening
			headers = {
				user = "Victor",
			},
		},
	},
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		build = "npm install -g mcp-hub@latest",
		config = function()
			require("mcphub").setup({
				extensions = {
					copilotchat = {
						enabled = true,
						convert_tools_to_functions = true,
						convert_resources_to_functions = true,
						add_mcp_prefix = false,
					},
				},
			})
		end,
	},
}
