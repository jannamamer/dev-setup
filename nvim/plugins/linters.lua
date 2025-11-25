local config = require("utils.config")
local env = config.get_env()
local default_linters = {
	base = [[
		bash=shellcheck,
		css=stylelint,
		html=htmlhint,
		javascript=eslint,
		json=spectral,
		lua=luacheck,
		markdown=proselint,
		sh=shellcheck,
		sql=sqlfluff,
		yaml=yamllint spectral
		]],
	dotnet = "",
	elixir = "elixir=credo",
	go = "go=golangcilint",
	java = "",
	python = "python=bandit mypy ruff",
	ruby = "ruby=brakeman reek rubocop",
	terraform = "hcl=tflint,terraform=tflint tfsec",
	dockerfile = "dockerfile=hadolint"
}

local linters = {
	general = env.VIM_LINTERS or default_linters.base,
}

-- Load tech stack specific linters
for _, stack in ipairs(vim.split(env.TECH_STACK, ",")) do
	local env_key = "VIM_" .. string.upper(stack) .. "_LINTERS"
	linters[stack] = env[env_key] or default_linters[stack]
end

if env.DOCKER_ENABLED == "true" then
	linters["dockerfile"] = env.VIM_DOCKERFILE_LINTERS or default_linters.dockerfile
end

local linters_by_ft = {}
for _, linter in pairs(linters) do
	for _, pair in ipairs(vim.split(linter, ",")) do
		if pair and pair ~= "" then
			local val = vim.split(pair, "=")
			local stack = val[1]
			linter = vim.split(val[2], " ")
			linters_by_ft[stack] = linter
		end
	end
end

vim.filetype.add({
	pattern = {
		[".*%.env"] = "dotenv",
	},
})

require("lint").linters_by_ft = linters_by_ft

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

vim.keymap.set("n", "<leader>dl", function()
	vim.diagnostic.setqflist()
	vim.cmd("copen")
end, { desc = "Open diagnostic list" })
