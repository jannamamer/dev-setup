" --- vim-fugitive ---

" Set status line display
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}
hi StatusLine                  ctermfg=16     ctermbg=255     cterm=NONE
hi StatusLineNC                ctermfg=59     ctermbg=250     cterm=NONE

lua << EOF
-- Fugitive main window
vim.keymap.set("n", "<C-g>", ":Git<CR>", { noremap = true, silent = true, desc = "Open Fugitive main window" })

-- Push and Pull
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true, desc = "Git push" })
vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { noremap = true, silent = true, desc = "Git pull" })

-- Git add current file
vim.keymap.set("n", "<leader>ga", ":Git add %<CR>", { noremap = true, silent = true, desc = "Git add current file" })

-- Git log
vim.keymap.set("n", "<leader>glg", ":Git log<CR>", { noremap = true, silent = true, desc = "Git log" })

-- Diff against index
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { noremap = true, silent = true, desc = "Git diff" })

-- Diff against HEAD (staged)
vim.keymap.set("n", "<leader>gds", ":Gvdiffsplit HEAD<CR>", { noremap = true, silent = true, desc = "Git diff (staged)" })

-- Blame current file
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true, desc = "Git blame" })

-- Commit
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true, desc = "Git commit" })
vim.keymap.set("n", "<leader>gca", ":Git commit --amend<CR>", { noremap = true, silent = true, desc = "Git commit --amend" })

-- Checkout branch
vim.keymap.set("n", "<leader>gco", ":Git checkout ", { noremap = true, silent = false, desc = "Git checkout" })

-- Merge conflict resolution (force diffsplit)
vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>", { noremap = true, silent = true, desc = "Resolve merge conflict visually" })
EOF

" Git commit message formatting
autocmd Filetype gitcommit setlocal spell

" --- vim-gitgutter ---
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
