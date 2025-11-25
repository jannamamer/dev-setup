local config = require("utils.config")
local env = config.get_env()
local default_formatters = {
	base = [[
		bash=shfmt,
		css=prettier,
		html=prettier,
		javascript=prettier,
		jq=jq,
		json=prettier,
		lua=stylua,
		markdown=codespell prettier,
		sh=shfmt,
		sql=sqlfluff,
		text=codespell,
		yaml=prettier,
		zsh=shfmt
	]],
	dotnet = "csharp=csharpier",
	elixir = "elixir=mix,heex=mix",
	go = "go=gofmt goimports",
	java = "",
	python = "python=black isort",
	ruby = "ruby=rubocop,eruby=htmlbeautifier rubocop",
	terraform = "hcl=hcl,terraform=terraform_fmt",
	dockerfile = "",
	bicep = "bicep=bicep"
}

local formatters = {
	general = env.VIM_FORMATTERS or default_formatters.base,
}

-- Load tech stack specific formatters
for _, stack in ipairs(vim.split(env.TECH_STACK, ",")) do
	local env_key = "VIM_" .. string.upper(stack) .. "_FORMATTERS"
	formatters[stack] = env[env_key] or default_formatters[stack]
end

if env.AZURE_ENABLED == "true" then
	formatters["bicep"] = default_linters.bicep
end

if env.DOCKER_ENABLED == "true" then
	formatters["dockerfile"] = env.VIM_DOCKERFILE_FORMATTERS or default_formatters.dockerfile
end

local formatters_by_ft = {}
for _, formatter in pairs(formatters) do
	for _, pair in ipairs(vim.split(formatter, ",")) do
		if pair and pair ~= "" then
			local val = vim.split(pair, "=")
			local stack = val[1]
			formatter = vim.split(val[2], " ")
			formatters_by_ft[stack] = formatter
		end
	end
end

require("conform").setup({
	formatters_by_ft = formatters_by_ft,
	format_on_save = {
		lsp_fallback = false,
		timeout_ms = 5000,
	},
	formatters = {
		black = {
			prepend_args = { "--fast" },
		},
	},
	stop_after_first = false,
	notify_on_error = true,
	notify_no_formatters = true,
})

-- Format file normal mode
vim.keymap.set("n", "<C-f>", function()
	require("conform").format()
end, { noremap = true, silent = true, desc = "Format file" })

-- Format file visual mode
vim.keymap.set("v", "<C-f>", function()
	require("conform").format()
end, { noremap = true, silent = true, desc = "Format file" })
