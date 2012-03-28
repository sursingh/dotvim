runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set modeline
" set statusline=%{fugitive#statusline()}
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" {{{ General Customizations
" set columns=80
let c_space_errors=1
set cmdheight=1
set textwidth=78 shiftwidth=4
set modeline modelines=5
set backspace=2			" allow backspacing over everything in insert mode
set ruler				" show line and column number of the cursor position
set hlsearch incsearch
set nocst  " no cscope tags

set formatoptions=tcroq
map \fs A /* {{{ */
map \fe A /* }}} */
set fdm=marker

set mouse=vih
map <C-Left>	:tabNext<CR>
map <C-Right>	:tabPrev<CR>

" {{{ key mappings
map <F5> :tN
map <F6> :tn
map <F7> :cN
map <F8> :cn
map <C-Right> :n
map <C-Left> :N
map <F2> :set invpaste<CR>
set pastetoggle=<F2>
map  <ESC>:e#
" }}}

highlight Pmenu ctermfg=0 ctermbg=6 guibg=grey30

syntax on
filetype plugin on
filetype indent on

set cinoptions=t0,l1,g0,(0,:0,l1,+8
" }}}

" Colorscheme {{{
set t_Co=256
let g:solarized_termcolors=16
set background=dark
colorscheme solarized
set background=dark
" }}}
" Mapping {{{
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent>  "+y
" }}}
" FileType mapping{{{
autocmd BufRead,BufNewFile *.tt set filetype=tt2
autocmd BufRead,BufNewFile *.gradle set filetype=groovy cin
" }}}

autocmd BufRead,BufNewFile *.adoc 
	    \ set syntax=asciidoc

" vim: set fdm=marker : "
