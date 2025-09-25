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

  " Display keybings
  Plug 'folke/which-key.nvim'

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

lua << EOF
vim.keymap.set("i", "hh", "<Esc>", { noremap = true, silent = true, desc = "Escape (Insert Mode)" })
vim.keymap.set("n", "<leader>z", "<C-Z>", { noremap = true, silent = true, desc = "Suspend Vim" })
vim.keymap.set("n", "<leader>N", ":vsplit | enew<CR>", { noremap = true, silent = true, desc = "New Empty Buffer" })

-- Save / Quit
vim.keymap.set("n", "ss", ":w<CR>", { noremap = true, silent = true, desc = "Save File" })
vim.keymap.set("n", "sa", ":w!<CR>", { noremap = true, silent = true, desc = "Save File: Force" })
vim.keymap.set("n", "qq", ":q<CR>", { noremap = true, silent = true, desc = "Quit" })
vim.keymap.set("n", "qa", ":q!<CR>", { noremap = true, silent = true, desc = "Quit: Without Saving" })

-- Window Splits
vim.keymap.set("n", "<leader>mv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Window: Vertical Split" })
vim.keymap.set("n", "<leader>ms", ":split<CR>", { noremap = true, silent = true, desc = "Window: Horizontal Split" })
vim.keymap.set("n", "<C-H>", "<C-W>h", { noremap = true, silent = true, desc = "Move: Left Window" })
vim.keymap.set("n", "<C-L>", "<C-W>l", { noremap = true, silent = true, desc = "Move: Right Window" })
vim.keymap.set("n", "<C-K>", "<C-W>j", { noremap = true, silent = true, desc = "Move: Down Window" })
vim.keymap.set("n", "<C-J>", "<C-W>k", { noremap = true, silent = true, desc = "Move: Up Window" })
vim.keymap.set("n", "<Tab>", "<C-W>w", { noremap = true, silent = true, desc = "Move: Next Window" })

-- Editor
vim.keymap.set("n", "k", "j", { noremap = true, silent = true, desc = "Move Cursor: Down" })
vim.keymap.set("n", "j", "k", { noremap = true, silent = true, desc = "Move Cursor: Up" })

EOF

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

" --- which-key.nvim ---
luafile ~/.config/nvim/plugins/key_finder.lua

" --- nerdcommenter ---
source ~/.config/nvim/plugins/commenter.vim

" --- jq ---
lua << EOF
vim.keymap.set("v", "<leader>jf", ":%!jq '.'<CR>", {
  noremap = true,
  silent = true,
  desc = "Format JSON"
})
EOF
