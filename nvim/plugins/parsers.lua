local config = require("utils.config")
local env = config.get_env()

if string.find(env.TECH_STACK, "dotnet") then
  env.TECH_STACK = string.gsub(env.TECH_STACK, "dotnet", "c_sharp")
end

local parsers = (env.VIM_PARSERS or "") .. "," .. (env.TECH_STACK or "")

if env.DOCKER_ENABLED == "true" then
	parsers = parsers .. "," .. "dockerfile"
end

require("nvim-treesitter.configs").setup({
	ensure_installed = vim.split(parsers, ","),
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})

-- Treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- Don't fold by default when opening a file

vim.treesitter.language.register("bash", "zsh")
