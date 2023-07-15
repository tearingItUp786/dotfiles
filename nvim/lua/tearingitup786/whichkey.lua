local wk = require("which-key")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local mappings = {
	t = {
		name = "Telescope",
		f = { ":Telescope find_files<CR>", "Telescope Find File" },
		g = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Telescope Live Grep" },
		b = { ":Telescope buffers<CR>", "Telescope buffers" },
		h = { ":Telescope help_tags<CR>", "Telescope help tags" },
	},
	s = {
		name = "split",
		v = { "<cmd>vsplit<cr>", "Vertical Split" },
		h = { "<cmd>split<cr>", "Horizontal Split" },
	},
	n = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
	q = {
		name = "quit",
		q = { "<cmd>q<cr>", "Quit" },
		w = { "<cmd>w<cr>", "Write" },
		x = { "<cmd>x<cr>", "Write and Quit" },
	},
	g = {
		name = "git",
		l = {
			"<cmd>lua LAZYGIT_TOGGLE()<CR>",
			"Lazy git",
		},
		g = {
			"<cmd>GitMessenger<CR>",
			"Git Messenger",
		},
	},
}

wk.register(mappings, { prefix = "<leader>" })
