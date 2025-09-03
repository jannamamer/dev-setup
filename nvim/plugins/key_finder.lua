local wk = require("which-key")

local function filter_mapping_display(mapping)
	if mapping.lhs:match("<Plug>") then
		return false
	end
	return true
end

wk.setup({
	preset = "modern",
	filter = filter_mapping_display,
	sort = { "local", "manual", "alphanum" },
	plugins = {
		marks = false,
		registers = false,
		spelling = {
			enabled = false,
		},
		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = false,
		},
	},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
		ellipsis = "...",
		mappings = false,
		rules = {},
		colors = true,
		keys = {
			Up = "↑",
			Down = "↓",
			Left = "←",
			Right = "→",
			C = "Ctrl",
			M = "Meta",
			D = "Del",
			S = "Shift",
			CR = "Enter",
			Esc = "Esc",
			ScrollWheelDown = "ScrollDn",
			ScrollWheelUp = "ScrollUp",
			NL = "Enter",
			BS = "Backsp",
			Space = "Space",
			Tab = "Tab",
			F1 = "F1",
			F2 = "F2",
			F3 = "F3",
			F4 = "F4",
			F5 = "F5",
			F6 = "F6",
			F7 = "F7",
			F8 = "F8",
			F9 = "F9",
			F10 = "F10",
			F11 = "F11",
			F12 = "F12",
		},
	},
	keys = {
		scroll_down = "K",
		scroll_up = "J",
	},
	show_help = true,
	show_keys = true,
})

wk.add({
	{ "nn", desc = "Escape (Insert Mode)" },
})

vim.keymap.set(
	"n",
	"<leader>/",
	":WhichKey<CR>",
	{ noremap = true, silent = true, desc = "Show all WhichKey mappings" }
)
