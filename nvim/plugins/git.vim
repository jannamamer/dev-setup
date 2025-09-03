" --- vim-fugitive ---

" Set status line display
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}
hi StatusLine                  ctermfg=16     ctermbg=255     cterm=NONE
hi StatusLineNC                ctermfg=59     ctermbg=250     cterm=NONE

" Fugitive window
nnoremap <leader>g :Git<CR>

" Push and pull
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git pull<CR>

" Git add
nnoremap <leader>ga :Git add %<CR>

" Git log for repo
nnoremap <leader>glg :Git log<CR>

" Diff current file against index
nnoremap <leader>gd :Gvdiffsplit<CR>

" Diff current file against HEAD (staged files)
nnoremap <leader>gds :Gvdiffsplit HEAD<CR>

" Git blame for current file
nnoremap <leader>gb :Git blame<CR>

" Commit
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gc :Git commit --amend<CR>

" Checkout branches
nnoremap <leader>gco :Git checkout<Space>

" If you hit a merge conflict, this helps resolve it visually
nnoremap <leader>gm :Gvdiffsplit!<CR>

" Git commit message formatting
autocmd Filetype gitcommit setlocal spell

" --- vim-gitgutter ---

" Stage hunk
nnoremap <leader>ggs :GitGutterStageHunk<CR>
nnoremap <leader>ggu :GitGutterUndoHunk<CR>

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
