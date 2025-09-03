" Leader Key
let mapleader=" "

" ========================================
" Plugin Manager: vim-plug
" ========================================
call plug#begin()
  " Files Plugins
  Plug 'junegunn/fzf'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf.vim'

  " Format Plugins
  Plug 'preservim/nerdcommenter'

  " Git Plugins
  Plug 'airblade/vim-gitgutter'   
  Plug 'tpope/vim-fugitive'
call plug#end()

" Enable filetype detection and plugins
filetype plugin indent on
syntax on

" ========================================
" General Settings
" ========================================

" Disables Vi compatibility mode and enables all Vim features
set nocompatible

" Sets the internal character encoding
set encoding=utf-8

" Disables “modelines” in files
set modelines=0

" Displays line numbers
set number

" Highlights the current line your cursor is on
set cursorline

" Automatically wrap text that extends beyond the screen length
set wrap

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Use the system clipboard for copy/paste.
set clipboard=unnamed

" Updates the terminal window title with the current file name
set title

" Enables mouse support in all modes
set mouse=a

" Speed up scrolling in Vim
set ttyfast

" Open vsplit to the right of the current window
set splitright

" Text Width
set textwidth=100

" Default tabs and indentation settings
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noshiftround
set autoindent

" --- Search settings ---

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" --- Display settings ---

" Shows the current Vim mode in the command line
set showmode

" Displays partial command inputs in the bottom right as you type them.
set showcmd

" Show matching brackets
set showmatch

" Adds the angle brackets (< >) as matching pairs
set matchpairs+=<:>

" Always show the status line
set laststatus=2

" Fixes common backspace problems
set backspace=indent,eol,start 

" Ignore patterns for completion
set wildignore+=deps,_build,node_modules,tmp

" ========================================
" Mappings
" ========================================

" Auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Escape insert mode
imap jj <Esc> 

" Save / Quit
nnoremap ss :w<CR>
nnoremap sa :w!<CR>
nnoremap qq :q<CR>
nnoremap qa :q!<CR>

" Window Splits
nnoremap <leader>mv :vsplit<CR>
nnoremap <leader>ms :split<CR>
nnoremap <C-J> <C-W>h
nnoremap <C-K> <C-W>j
nnoremap <C-I> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-O> <C-W>i
nmap <tab> <C-W>w

" Suspend Vim
nnoremap <leader>z <C-Z>

" Tagbar
nnoremap <F8> :TagbarToggle<CR>

" Mapped tab for completion suggestion
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

" ========================================
" Plugin Configurations
" ========================================

" --- nerdtree ---

" File browser
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Show hidden files
let NERDTreeShowHidden = 1

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" --- nerdcommenter ---

" Toggle comment normal mode
nnoremap kc <Plug>NERDCommenterToggle

" Toggle comment visual mode
vnoremap kc <Plug>NERDCommenterToggle

" Uncomment normal mode
nnoremap ku <Plug>NERDCommenterUncomment

" Uncomment visual mode
vnoremap ku <Plug>NERDCommenterUncomment

" Unmap default mappings
let g:NERDCreateDefaultMappings = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" --- fzf ---

" Redefine Files to open in new tab
command! Files call fzf#vim#files('', {'sink': 'vsplit'})

" Find files
nnoremap <leader>p :Files<CR>

" Find string (ripgrep required)
nnoremap <leader>f :Rg<Space>

" --- jq ---

" Format JSON
nnoremap <leader>jf :%!jq '.'<CR>

" --- vim-fugitive ---

" Set status line display
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}
hi StatusLine                  ctermfg=16     ctermbg=255     cterm=NONE
hi StatusLineNC                ctermfg=59     ctermbg=250     cterm=NONE

" Git status
nnoremap <leader>gs :Git<CR>

" Push and pull
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git pull<CR>

" Git add
nnoremap <leader>ga :Git add<CR>

" Git log for repo
nnoremap <leader>glg :Git log<CR>

" Diff current file against index
nnoremap <leader>gd :Gvdiffsplit<CR>

" Git blame for current file
nnoremap <leader>gb :Git blame<CR>

" Commit
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gcf :Git commit cf<CR>

" Checkout branches
nnoremap <leader>gco :Git checkout<Space>

" If you hit a merge conflict, this helps resolve it visually
nnoremap <leader>gm :Gvdiffsplit!<CR>

" Git commit message formatting
autocm Filetype gitcommit setlocal spell

" --- vim-gitgutter ---

" GitGutter settings
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
