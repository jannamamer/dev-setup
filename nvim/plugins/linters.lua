local config = require("utils.config")
local env = config.get_env()
local linters = {
	general = env.GENERAL_LINTERS or "",
}

-- Load tech stack specific linters
for _, stack in ipairs(vim.split(env.TECH_STACK, ",")) do
	local env_key = string.upper(stack) .. "_LINTERS"
	linters[stack] = env[env_key]
end

local linters_by_ft = {}
for key, linter in pairs(linters) do
	for _, pair in ipairs(vim.split(linter, ",")) do
		if pair and pair ~= "" then
			val = vim.split(pair, "=")
			stack = val[1]
			linter = vim.split(val[2], " ")
			linters_by_ft[stack] = linter
		end
	end
end

require("lint").linters_by_ft = linters_by_ft
