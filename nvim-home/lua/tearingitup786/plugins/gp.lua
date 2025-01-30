local command = "op read op://private/OpenAI/credential --no-newline"
local handle = io.popen(command, "r")
local result = handle:read("*a") -- Read the entire output as a string
handle:close()

return {
	"robitx/gp.nvim",
	config = function()
		local conf = {
			-- For customization, refer to Install > Configuration in the Documentation/Readme
			providers = {
				openai = {
					endpoint = "https://api.openai.com/v1/chat/completions",
					secret = result,
				},
			},
		}
		require("gp").setup(conf)

		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
	end,
}
