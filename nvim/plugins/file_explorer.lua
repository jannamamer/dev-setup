local config = require("utils.config")
local env = config.get_env()

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	-- Load all default mappings
	api.config.mappings.default_on_attach(bufnr)

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	-- Disable <Tab> only (without affecting <CR> or others)
	vim.keymap.set("n", "<Tab>", "<C-w>w", opts("Switch window"))
end

-- Git status colors
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#4CAF50", ctermfg = 71 })
		vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#C4B200", ctermfg = 143 })
		vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#C4B200", ctermfg = 143 })
		vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#D65F5F", ctermfg = 167 })
		vim.api.nvim_set_hl(0, "NvimTreeGitUntracked", { fg = "#4CAF50", ctermfg = 71 })
		vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#5C6370", ctermfg = 244 })
	end,
})

local dependency_directories = {}
for _, dir in ipairs(vim.split(env.DEPENDENCY_DIRECTORIES, ",")) do
	table.insert(dependency_directories, "/" .. dir)
end

require("nvim-tree").setup({
	on_attach = on_attach,
	hijack_cursor = false,
	auto_reload_on_write = true,
	disable_netrw = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	select_prompts = false,
	sort = {
		sorter = "name",
		folders_first = true,
		files_first = false,
	},
	view = {
		centralize_selection = false,
		cursorline = true,
		cursorlineopt = "both",
		debounce_delay = 15,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		width = 30,
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		full_name = false,
		root_folder_label = ":~:s?$?/..?",
		indent_width = 2,
		special_files = vim.split(env.SPECIAL_FILES, ","),
		hidden_display = "none",
		symlink_destination = true,
		decorators = { "Git", "Open", "Hidden", "Modified", "Bookmark", "Diagnostics", "Copied", "Cut" },
		highlight_git = "name",
		highlight_diagnostics = "all",
		highlight_opened_files = "all",
		highlight_modified = "all",
		highlight_hidden = "name",
		highlight_bookmarks = "none",
		highlight_clipboard = "name",
		indent_markers = {
			enable = false,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			web_devicons = {
				file = {
					enable = false,
					color = false,
				},
				folder = {
					enable = false,
					color = false,
				},
			},
			git_placement = "before",
			modified_placement = "after",
			hidden_placement = "after",
			diagnostics_placement = "signcolumn",
			bookmarks_placement = "signcolumn",
			padding = {
				icon = " ",
				folder_arrow = " ",
			},
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
				hidden = false,
				diagnostics = true,
				bookmarks = false,
			},
			glyphs = {
				default = "📄",
				symlink = "🔗",
				bookmark = "📌",
				modified = "✏️",
				folder = {
					arrow_closed = "▶",
					arrow_open = "▼",
					default = "📁",
					open = "📂",
					-- empty = "",
					-- empty_open = "",
					symlink = "🔗",
				},
				git = {
					unstaged = "~",
					staged = "✓",
					unmerged = "!",
					renamed = "➜",
					untracked = "+",
					deleted = "✗",
					ignored = "◌",
				},
			},
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = false,
		update_root = {
			enable = false,
			ignore_list = {},
		},
		exclude = false,
	},
	system_open = {
		cmd = "",
		args = {},
	},
	git = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		disable_for_dirs = {},
		timeout = 400,
		cygwin_support = false,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		show_on_open_dirs = true,
		debounce_delay = 500,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = "💡",
			info = "ℹ️",
			warning = "⚠️",
			error = "❌",
		},
	},
	modified = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	filters = {
		enable = true,
		git_ignored = true,
		dotfiles = false,
		git_clean = false,
		no_buffer = false,
		no_bookmark = false,
		custom = {},
		exclude = {},
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = dependency_directories,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = "cursor",
				border = "shadow",
				style = "minimal",
			},
		},
		open_file = {
			quit_on_open = false,
			eject = true,
			resize_window = true,
			relative_path = true,
			window_picker = {
				enable = true,
				picker = "default",
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	trash = {
		cmd = "gio trash",
	},
	tab = {
		sync = {
			open = false,
			close = false,
			ignore = {},
		},
	},
	notify = {
		threshold = vim.log.levels.INFO,
		absolute_path = true,
	},
	help = {
		sort_by = "key",
	},
	ui = {
		confirm = {
			remove = true,
			trash = true,
			default_yes = false,
		},
	},
	experimental = {},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
})

-- Open file in new tab unless current buffer is nvim-tree
local startup_page = require("utils.startup_page")
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(data)
		local directory = vim.fn.isdirectory(data.file) == 1
		if directory or data.file == "" then
			require("nvim-tree.api").tree.open()
			vim.api.nvim_command("wincmd w")
			startup_page.create()
		end
	end,
})

-- File explorer
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Collapse file explorer
vim.keymap.set("n", "<C-n>", ":NvimTreeCollapse<CR>", { noremap = true, silent = true })
