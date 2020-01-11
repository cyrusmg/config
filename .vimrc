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


function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

" use ctrl-t to open file in a new tab
" use ctrl-f to open file in current buffer
map <c-t> :call DmenuOpen("tabe")<cr>
map <c-f> :call DmenuOpen("e")<cr>

" execute pathogen#infect()
