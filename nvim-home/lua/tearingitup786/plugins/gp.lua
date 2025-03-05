local command = "op read op://private/OpenAI/credential --no-newline"
local handle = io.popen(command, "r")
local result = handle:read("*a") -- Read the entire output as a string
handle:close()

local claude_command = "op read op://private/Claude/credential --no-newline"
local claude_handle = io.popen(claude_command, "r")
local claude_result = claude_handle:read("*a") -- Read the entire output as a string
claude_handle:close()

return {
	"robitx/gp.nvim",
	config = function()
		local conf = {
			-- For customization, refer to Install > Configuration in the Documentation/Readme
			providers = {
				anthropic = {
					endpoint = "https://api.anthropic.com/v1/messages",
					secret = claude_result,
				},
				openai = {
					endpoint = "https://api.openai.com/v1/chat/completions",
					secret = result,
				},
			},
			agents = {
				{
					name = "Claude 3.7",
					provider = "anthropic",
					chat = true,
					command = true,
					model = { model = "claude-3-7-sonnet-20250219" },
					system_prompt = "You are a helpful assistant that helps me with my coding related tasks.",
				},
			},
		}
		require("gp").setup(conf)

		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
	end,
}
