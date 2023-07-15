local status, db = pcall(require, "dashboard")
if not status then
	return
end

db.setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
		},
	},
})
