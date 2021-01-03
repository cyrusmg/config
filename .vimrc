syntax on
colo desert

set ai                  " autoindent
set si                  " smartindent
set cindent             " do c-style indenting
set tabstop=4           " tab spacing (settings below are just to unify it)
set softtabstop=4       " unify
set shiftwidth=2        " indent by 2
set expandtab           " NO tabs please!
set nowrap              " do not wrap lines
set smarttab            " use tabs at the start of a line, spaces elsewhere

" show tab characters
set encoding=utf-8
set list listchars=tab:→\ ,trail:·
set list

" set number
set relativenumber
set showmatch

set hlsearch
set t_Co=256            " more than 16 colors for theme
set incsearch           " do incremental searching
set ignorecase          " turn off by :set noignorecase
set pastetoggle=<F10>

let &path.="src/include,include,../../include,"

set nocp " non vi compatible mode
filetype plugin on " enable plugins

hi Search cterm=NONE ctermfg=black ctermbg=yellow

" Plug extension - autoload
" :PlugInstall to install plugins.
" :CocInstall coc-tsserver coc-json
set nocompatible
call plug#begin('~/.vim/plugged')

" Syntax Highlighter
Plug 'sheerun/vim-polyglot'
" Eslint Integration
Plug 'dense-analysis/ale'
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" File search
Plug 'junegunn/fzf.vim'

call plug#end()

" ALE config
let g:ale_linters = {
\   'javascript': ['prettier', 'eslint', 'standard', 'tsserver'],
\   'typescript': ['prettier', 'eslint', 'standard', 'tsserver']
\ }
let g:ale_fixers = {
\   'javascript': ['prettier', 'tslint', 'eslint'],
\   'typescript': ['prettier', 'tslint', 'eslint']
\ }

nmap <F6> <Plug>(ale_fix)

" COC config
inoremap <silent><expr> <Nul> coc#refresh() 

" FZF config
nnoremap <C-t> :GFiles<CR>
nnoremap <C-f> :Ag<CR>
