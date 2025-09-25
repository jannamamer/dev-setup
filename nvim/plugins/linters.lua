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

if env.DOCKER_ENABLED == "true" then
	linters["dockerfile"] = env["DOCKERFILE_LINTERS"]
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
