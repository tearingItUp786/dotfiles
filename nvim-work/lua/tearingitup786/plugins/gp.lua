return {
	"robitx/gp.nvim",
	config = function()
		-- Load API keys from environment variables or a secure source
		local anthropic_key = os.getenv("ANTHROPIC_API_KEY") or ""
		local openai_key = os.getenv("OPENAI_API_KEY") or ""

		local conf = {
			-- For customization, refer to Install > Configuration in the Documentation/Readme
			providers = {
				openai = {
					endpoint = "https://api.openai.com/v1/chat/completions",
					secret = openai_key,
				},
			},
			agents = {
				{
					name = "My GPT 5.5",
					provider = "openai",
					chat = true,
					command = true,
					model = { model = "gpt-5.5" },
					system_prompt = "You are a helpful assistant that helps me with my coding related tasks. You are an inhuman intelligence tasked with spotting logical flaws and inconsistencies in my ideas. Never agree with me unless my reasoning is watertight. Never use friendly or encouraging language. If I'm being vague, ask for clarification before proceeding. Your goal is not to help me feel good. It is to help me think better",
				},
			},
		}
		require("gp").setup(conf)

		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
	end,
}
