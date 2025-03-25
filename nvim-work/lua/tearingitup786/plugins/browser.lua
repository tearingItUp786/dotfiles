return {
	"tyru/open-browser.vim",
	config = function()
		-- Set up keymaps
		vim.keymap.set("n", "gx", "<Plug>(openbrowser-smart-search)", { desc = "Open URL under cursor" })
		vim.keymap.set("v", "gx", "<Plug>(openbrowser-smart-search)", { desc = "Open selected URL" })

		-- Configure search engine options
		vim.g.openbrowser_search_engines = {
			github = "https://github.com/search?q={query}",
			google = "https://google.com/search?q={query}",
			stackoverflow = "https://stackoverflow.com/search?q={query}",
		}

		-- Default search engine
		vim.g.openbrowser_default_search = "google"
	end,
}
