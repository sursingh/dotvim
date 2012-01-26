runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set modeline
" set statusline=%{fugitive#statusline()}
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" Colorscheme {{{
set t_Co=256
let g:solarized_termcolors=16
set background=dark
colorscheme solarized
set background=dark
" }}}
" Mapping {{{
nnoremap <silent> <F9> :TagbarToggle<CR>
" }}}
" FileType mapping{{{
autocmd BufRead,BufNewFile *.tt set filetype=tt2
" }}}


" vim: set fdm=marker : "
