local M = {}

function M.get_env()
	local env = {}
	local multiline = {
		collecting = false,
		key = nil,
		value = {},
	}

	for line in io.lines(vim.fn.expand("~/.config.env")) do
		if line:match("^[%w_]+='%s*$") then
			multiline = {
				collecting = true,
				key = line:match("^([%w_]+)='%s*$"),
				value = {},
			}
		elseif line:match("^'%s*$") and multiline.collecting then
			env[multiline.key] = table.concat(multiline.value)
			multiline = {
				collecting = false,
				key = nil,
				value = {},
			}
		elseif multiline.collecting then
			table.insert(multiline.value, (line:gsub("[\n\r]", "")))
		else
			local key, value = line:match("^%s*([^=]+)%s*=%s*['\"]?(.-)['\"]?$")
			if key and value then
				env[key] = value
			end
		end
	end

	return env
end

return M
