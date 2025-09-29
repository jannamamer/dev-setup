vim.keymap.set("n", "<leader>kc", "<Plug>NERDCommenterComment", {
	noremap = true,
	silent = true,
	desc = "Comment",
})

vim.keymap.set("v", "<leader>kc", "<Plug>NERDCommenterComment", {
	noremap = true,
	silent = true,
	desc = "Comment",
})

vim.keymap.set("n", "<leader>ku", "<Plug>NERDCommenterUncomment", {
	noremap = true,
	silent = true,
	desc = "Uncomment",
})

vim.keymap.set("v", "<leader>ku", "<Plug>NERDCommenterUncomment", {
	noremap = true,
	silent = true,
	desc = "Uncomment",
})

-- Unmap default mappings
vim.g.NERDCreateDefaultMappings = 0

-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1
