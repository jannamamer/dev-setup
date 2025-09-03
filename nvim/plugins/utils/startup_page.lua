local M = {}

local function center_line(text, width)
	local len = #text
	if len >= width then
		return text
	end
	local left_padding = math.floor((width - len) / 2)
	return left_padding, string.rep(" ", left_padding) .. text
end

local function center_ascii_block_with_center_line(logo, width)
	local widest_line = ""
	for _, line in ipairs(logo) do
		if #line > #widest_line then
			widest_line = line
		end
	end

	local left_padding, _ = center_line(string.rep(" ", vim.fn.strdisplaywidth(widest_line)), width)
	local left_padding_spaces = string.rep(" ", left_padding)

	-- Apply padding to each line
	for i, line in ipairs(logo) do
		logo[i] = left_padding_spaces .. line
	end

	return logo
end

function M.create()
	vim.cmd("enew")

	-- Make buffer non-modifiable while we set it up
	vim.bo.modifiable = true
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "hide"
	vim.bo.swapfile = false
	vim.bo.filetype = "startpage"

	local width = vim.api.nvim_win_get_width(0)
	local height = vim.api.nvim_get_option("lines")
	local version = vim.version()

	local logo = {
		"███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
		"████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
		"██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
		"██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
		"██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
		"╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
	}

	local content_lines = {
		"Welcome to Neovim",
		string.format("Version %d.%d.%d", version.major, version.minor, version.patch),
		"",
		"Press qq to quit",
		"Use <leader>n to toggle file explorer",
	}

	local centered_logo = center_ascii_block_with_center_line(logo, width)

	-- Center all lines horizontally
	for i, line in ipairs(content_lines) do
		_, content_lines[i] = center_line(line, width)
	end

	-- Calculate vertical padding for roughly vertical center
	local top_padding = math.floor((height - (#logo + #content_lines)) / 2)

	-- Build full lines with top padding
	local lines = {}
	for _ = 1, top_padding do
		table.insert(lines, "")
	end

	vim.list_extend(lines, vim.list_extend(centered_logo, content_lines))

	-- Set buffer lines
	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

	vim.bo.modifiable = false

	-- Highlight ASCII art
	for i = 1, 6 do
		vim.api.nvim_buf_add_highlight(0, -1, "String", top_padding + i - 1, 0, -1)
	end

	-- Highlight welcome message
	vim.api.nvim_buf_add_highlight(0, -1, "Function", top_padding + 7, 0, -1)
	vim.api.nvim_buf_add_highlight(0, -1, "Type", top_padding + 8, 0, -1)
end

return M
