local config = require("utils.config")
local env = config.get_env()

local dependency_directories = {}
for _, dir in ipairs(vim.split(env.DEPENDENCY_DIRECTORIES, ",")) do
	table.insert(dependency_directories, '--glob "!' .. dir .. '/*" ')
end

--Update default command to exclude dependency directories
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*" ' .. table.concat(dependency_directories)

-- Find files
vim.keymap.set("n", "<leader>p", ":Files<CR>", { noremap = true, silent = true })

-- Git status
vim.keymap.set("n", "<leader>gs", ":GFiles?<CR>", { noremap = true, silent = true })

-- Find string (ripgrep required)
vim.keymap.set("n", "<leader>f", ":RG<CR>", { noremap = true, silent = true })
