local config = require("utils.config")
local env = config.get_env()

local parsers = (env.GENERAL_PARSERS or "") .. "," .. (env.TECH_STACK or "")
require("nvim-treesitter.configs").setup({
	ensure_installed = vim.split(parsers, ","),
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- Start selection
			node_incremental = "grn", -- Increment to the upper node
			scope_incremental = "grc", -- Increment scope
			node_decremental = "grm", -- Decrement node
		},
	},
})

-- Treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- Don't fold by default when opening a file
