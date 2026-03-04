return {
	"robitx/gp.nvim",
	config = function()
		-- Load API keys from environment variables or a secure source
		local anthropic_key = os.getenv("ANTHROPIC_API_KEY") or ""
		local openai_key = os.getenv("OPENAI_API_KEY") or ""

		local conf = {
			-- For customization, refer to Install > Configuration in the Documentation/Readme
			providers = {
				anthropic = {
					endpoint = "https://api.anthropic.com/v1/messages",
					secret = anthropic_key,
				},
				openai = {
					endpoint = "https://api.openai.com/v1/chat/completions",
					secret = openai_key,
				},
			},
			agents = {
				{
					name = "My Claude Sonnet 4.5",
					provider = "anthropic",
					chat = true,
					command = true,
					model = { model = "claude-sonnet-4-5-20250929" },
					system_prompt = "You are a helpful assistant that helps me with my coding related tasks.",
				},
				{
					name = "My Claude Sonnet 4.6",
					provider = "anthropic",
					chat = true,
					command = true,
					model = { model = "claude-sonnet-4-6" },
					system_prompt = "You are a helpful assistant that helps me with my coding related tasks.",
				},
			},
		}
		require("gp").setup(conf)

		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
	end,
}
