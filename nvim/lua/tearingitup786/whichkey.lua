local wk = require("which-key")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local mappings = {
	c = {
		name = "ChatGPT",
		i = { ":ChatGPTActAs<CR>", "Act as someone" },
		c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
		e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
		g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
		t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
		k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
		d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
		a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
		o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
		s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
		f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
		x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
		r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
		l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
	},
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
	n = {
		name = "nvimtree",
		n = { ":NvimTreeToggle<CR>", "Toggle" },
		f = { ":NvimTreeFocus<CR>", "Focus" },
	},
	q = {
		name = "quit",
		d = { "<cmd>bd<cr>", "Delete buffer" },
		q = { "<cmd>q<cr>", "Quit" },
		w = { "<cmd>w<cr>", "Write" },
		x = { "<cmd>x<cr>", "Write and Quit" },
	},
	b = {
		name = "buffer commands",
		d = { "<cmd>bd<cr>", "Delete buffer" },
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
wk.setup({})
