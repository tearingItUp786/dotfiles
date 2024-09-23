return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>b", group = "buffer commands" },
			{ "<leader>bd", "<cmd>bd<cr>", desc = "Delete buffer" },
			{ "<leader>c", group = "ChatGPT" },
			{ "<leader>cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
			{ "<leader>ci", ":ChatGPTActAs<CR>", desc = "Act as someone" },
			{ "<leader>g", group = "git" },
			{ "<leader>gg", "<cmd>GitMessenger<CR>", desc = "Git Messenger" },
			{ "<leader>gl", "<cmd>lua LAZYGIT_TOGGLE()<CR>", desc = "Lazy git" },
			{ "<leader>gc", "<cmd>:CopilotChat<CR>", desc = "CopilotChat" },
			{ "<leader>n", group = "nvimtree" },
			{ "<leader>nf", ":NvimTreeFocus<CR>", desc = "Focus" },
			{ "<leader>nn", ":NvimTreeToggle<CR>", desc = "Toggle" },
			{ "<leader>q", group = "quit" },
			{ "<leader>qd", "<cmd>bd<cr>", desc = "Delete buffer" },
			{ "<leader>qq", "<cmd>q<cr>", desc = "Quit" },
			{ "<leader>qw", "<cmd>w<cr>", desc = "Write" },
			{ "<leader>qx", "<cmd>x<cr>", desc = "Write and Quit" },
			{ "<leader>s", group = "split" },
			{ "<leader>sh", "<cmd>split<cr>", desc = "Horizontal Split" },
			{ "<leader>sv", "<cmd>vsplit<cr>", desc = "Vertical Split" },
			{ "<leader>t", group = "Telescope" },
			{ "<leader>tb", ":Telescope buffers<CR>", desc = "Telescope buffers" },
			{ "<leader>tf", ":Telescope find_files<CR>", desc = "Telescope Find File" },
			{
				"<leader>tg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
				desc = "Telescope Live Grep",
			},
			{ "<leader>th", ":Telescope help_tags<CR>", desc = "Telescope help tags" },
			{
				mode = { "n", "v" },
				{ "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
				{ "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
				{ "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
				{ "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
				{ "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
				{ "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
				{ "<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
				{ "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
				{ "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
				{ "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
				{ "<leader>ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
				{ "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
			},
		})
		wk.setup({})
	end,
}
