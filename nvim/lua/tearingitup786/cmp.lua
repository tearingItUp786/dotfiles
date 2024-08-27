-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

local preferred_sources = {
	{ name = "nvim_lsp" }, -- lsp
	{ name = "luasnip" }, -- snippets
	{ name = "copilot" }, -- copilot
	{ name = "path" }, -- file system paths
}

local function tooBig(bufnr)
	local max_filesize = 10 * 1024 -- 100 KB
	local check_stats = (vim.uv or vim.loop).fs_stat
	local ok, stats = pcall(check_stats, vim.api.nvim_buf_get_name(bufnr))
	if ok and stats and stats.size > max_filesize then
		return true
	else
		return false
	end
end
vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("CmpBufferDisableGrp", { clear = true }),
	callback = function(ev)
		local sources = preferred_sources
		if not tooBig(ev.buf) then
			sources[#sources + 1] = { name = "buffer", keyword_length = 4 }
		end
		cmp.setup.buffer({
			sources = cmp.config.sources(sources),
		})
	end,
})

cmp.setup({
	autostart = true,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "copilot" }, -- copilot
		{ name = "path" }, -- file system paths
		{ name = "buffer" }, -- text within current buffer
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 100,
			ellipsis_char = "...",
		}),
	},
})
