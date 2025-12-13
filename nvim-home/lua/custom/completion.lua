local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	print("no cmp found")
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	print("no luasnip")
	return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	print("no lskind")
	return
end

lspkind.init({})
vim.opt.completeopt = "menu,menuone,noselect"

local preferred_sources = {
	{ name = "nvim_lsp" }, -- lsp
	{ name = "luasnip" }, -- snippets
	{ name = "copilot" }, -- copilot
	{ name = "path" }, -- file system paths
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources(preferred_sources, {
		{ name = "buffer" },
	}),
})
