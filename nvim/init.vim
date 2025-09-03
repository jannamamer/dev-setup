" Leader Key
let mapleader=" "

" Disable netrw (recommended by nvim-tree)
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" ========================================
" Plugin Manager: vim-plug
" ========================================
call plug#begin()
  " Plugin manager (for updates)
  Plug 'junegunn/vim-plug'

  " File finder and navigation
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-tree/nvim-tree.lua'

  " Git Plugins
  Plug 'airblade/vim-gitgutter'   
  Plug 'tpope/vim-fugitive'

  " Text editing helpers
  Plug 'preservim/nerdcommenter'

  " Formatting, Linting, Syntax highlighting
  Plug 'stevearc/conform.nvim'
  Plug 'mfussenegger/nvim-lint'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" Enable filetype detection and plugins
filetype plugin indent on
syntax off

" ========================================
" General Settings
" ========================================

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
set clipboard=unnamedplus

" Updates the terminal window title with the current file name
set title

" Enables mouse support in all modes
set mouse=a

" Speed up scrolling in Vim
set ttyfast

" Enable true color support
set termguicolors

" Use terminal-aware colorscheme
colorscheme slate

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

" ========================================
" Mappings
" ========================================

" Auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>

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
nnoremap <Tab> <C-w>w

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

" Load environment variables
lua << EOF
package.path = package.path .. ";" .. vim.fn.stdpath('config') .. "/plugins/?.lua"
EOF

" --- vim-gitgutter / vim-fugitive ---
source ~/.config/nvim/plugins/git.vim

" --- nvim-tree.lua ---
luafile ~/.config/nvim/plugins/file_explorer.lua

" --- fzf ---
luafile ~/.config/nvim/plugins/file_finder.lua

" --- conform.nvim ---
luafile ~/.config/nvim/plugins/formatters.lua

" --- nvim-treesitter ---
luafile ~/.config/nvim/plugins/parsers.lua

" --- nvim-lint ---
luafile ~/.config/nvim/plugins/linters.lua

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

" --- jq ---

" Format JSON
nnoremap <leader>jf :%!jq '.'<CR>
