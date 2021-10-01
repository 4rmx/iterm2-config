syntax on

set guicursor=
set noshowmatch
set noshowmode
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set updatetime=50
set shortmess+=c
set encoding=UTF-8
set nocompatible

set colorcolumn=80,120,140
highlight ColorColumn ctermbg=238 guibg=dimgrey

call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-commentary'
Plug 'Chiel92/vim-autoformat'
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

call plug#end()

if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Make `Function`s bold in GUI mode
    " autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    " Override the `Statement` foreground color in 256-color mode
    " autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
    " Override the `Identifier` background color in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Normal", { "bg": { "gui": "#191919" } })
  augroup END
endif

colorscheme onedark
set background=dark

let airline#extensions#tmuxline#snapshot_file = "~/.config/tmux/tmux-status.conf"
let g:airline_powerline_fonts = 1
" let g:airline_theme='onedark'

" inoremap kj <ESC>

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

:nnoremap <space>e :CocCommand explorer<CR>
nnoremap <F3> :Autoformat<CR>
nmap <Leader>p <Plug>(Prettier)

" NERDTree key
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
