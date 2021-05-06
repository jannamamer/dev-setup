" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'townk/vim-autoclose'
Plugin 'nvie/vim-flake8'
Plugin 'sheerun/vim-polyglot'
Plugin 'docunext/closetag.vim'
Plugin 'wincent/command-t'
Plugin 'slashmili/alchemist.vim'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'elixir-editors/vim-elixir' 
Plugin 'w0rp/ale'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
call vundle#end()

" Set compatibility to Vim only.
set nocompatible

" Turn on syntax highlighting.
syntax on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

set textwidth=100
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noshiftround
set autoindent
set number
set cursorline

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd
set showmatch " Show matching brackets

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Set status line display
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}
hi StatusLine                  ctermfg=16     ctermbg=255     cterm=NONE
hi StatusLineNC                ctermfg=59     ctermbg=250     cterm=NONE

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

set clipboard=unnamed

set title

" Ale settings
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Mapped tab for completion suggestion
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

" For plug-ins to load correctly.
filetype plugin indent on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" Show hidden files
let NERDTreeShowHidden=1

let mapleader=" "

" NERDTree settings
map <leader>n :NERDTreeToggle<CR>
set wildignore+=deps,_build,node_modules,tmp

" GitGutter settings
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Open Tagbar Window
nmap <F8> :TagbarToggle<CR>

" Remap Esc with jj
imap jj <Esc>

" Save Window
map ss :w <cr>
map sa :w! <cr>

" Exit Window
map qq :q <cr>
map qa :q! <cr>

" Map suspend
map <leader>z <C-Z>

" Windows Mappings
map <leader>mv :vsplit <cr>
map <leader>ms :split <cr>
map <C-J> <C-W>h <cr>
map <C-K> <C-W>j <cr>
map <C-I> <C-W>k <cr>
map <C-L> <C-W>l <cr>
map <C-O> <C-W>i <cr>

" Navigate splits
nmap <tab> <c-w>w

" Open files
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>

" Format json
map <leader>jf :%!jq '.' <cr>

autocm Filetype gitcommit setlocal spell
