" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

set textwidth=79
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
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
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

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

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_debug = 3
let g:syntastic_python_checkers=['flake8']
let g:syntastic_enable_elixir_checker = 1

" Enable all Python syntax highlighting features
let python_highlight_all=1

" Mapped tab for completion suggestion
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'townk/vim-autoclose'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'sheerun/vim-polyglot'
Plugin 'docunext/closetag.vim'
Plugin 'wincent/command-t'
Plugin 'elixir-editors/vim-elixir' 
Plugin 'slashmili/alchemist.vim'
Plugin 'OmniSharp/omnisharp-vim'
call vundle#end()

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" Show hidden files
let NERDTreeShowHidden=1

let mapleader=" "

" Open/Close NERDTree
map <leader>n :NERDTreeToggle<CR>
" Open Tagbar Window
nmap <F8> :TagbarToggle<CR>

" map :f :find<space>

" Remap Esc with jj
imap jj <Esc>
" Sav Window
map ss :w<cr>
" Exit Window
map qq :q <cr>
map qa :q! <cr>
" Map the source to leader so
" map <leader>so :so %<cr>
" Map suspend
map <leader>z <C-Z>
" Tab Mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmov
" Windows Mappings
map <leader>mv :vsplit <cr>
map <leader>ms :split <cr>
map <C-H> <C-W>h <cr>
map <C-J> <C-W>j <cr>
map <C-K> <C-W>k <cr>
map <C-L> <C-W>l <cr>
" Navigate splits
nmap <tab> <c-w>w
" Open files
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>

autocm Filetype gitcommit setlocal spell

" let $RUBYHOME=$HOME."/.rvm/rubies/default"
" set rubydll=$RUBYHOME/lib/libruby.dylib
