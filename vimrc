runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set modeline
" set statusline=%{fugitive#statusline()}
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

set t_Co=256
let g:solarized_termcolors=16
colorscheme solarized
set background=dark
