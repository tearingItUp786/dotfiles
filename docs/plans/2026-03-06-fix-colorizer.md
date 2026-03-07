# Fix nvim-highlight-colors Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Fix `nvim-highlight-colors` so color swatches render in both `nvim-home` and `nvim-work`.

**Architecture:** The existing `brenoprata10/nvim-highlight-colors` plugin is correct, but the minimal config in `nvim-home/colorizer.lua` lacks options that activate CSS, named colors, and Tailwind properly. `nvim-work` has no colorizer at all. We fix both.

**Tech Stack:** Neovim + lazy.nvim + nvim-highlight-colors

---

### Task 1: Fix nvim-home colorizer config

**Files:**
- Modify: `nvim-home/lua/tearingitup786/plugins/colorizer.lua`

**Step 1: Update the config**

Replace the contents of `nvim-home/lua/tearingitup786/plugins/colorizer.lua` with:

```lua
return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-highlight-colors").setup({
			render = "background",
			enable_named_colors = true,
			enable_tailwind = true,
			enabled_css = true,
		})
	end,
}
```

Key changes:
- Added `event = { "BufReadPre", "BufNewFile" }` so it loads when a buffer opens (not deferred forever)
- Added `enable_named_colors = true` to catch named CSS colors like `red`, `blue`
- Added `enabled_css = true` to catch `rgb()`, `hsl()`, etc.

**Step 2: Commit**

```bash
git add nvim-home/lua/tearingitup786/plugins/colorizer.lua
git commit -m "fix(nvim-home): fix nvim-highlight-colors not showing colors"
```

---

### Task 2: Add colorizer to nvim-work

**Files:**
- Create: `nvim-work/lua/tearingitup786/plugins/colorizer.lua`

**Step 1: Create the file with identical config**

```lua
return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-highlight-colors").setup({
			render = "background",
			enable_named_colors = true,
			enable_tailwind = true,
			enabled_css = true,
		})
	end,
}
```

**Step 2: Commit**

```bash
git add nvim-work/lua/tearingitup786/plugins/colorizer.lua
git commit -m "feat(nvim-work): add nvim-highlight-colors colorizer"
```
