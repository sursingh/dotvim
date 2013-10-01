" Toggle the tasklist
map <leader>td <Plug>TaskList

set softtabstop=4

" Run pep8
let g:pep8_map='<leader>8'

" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Run command-t file search
map <leader>f :CommandT<CR>
" Ack searching
nmap <leader>a <Esc>:Ack!

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

set guifont=Monospace\ 10

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

autocmd FileType go autocmd BufWritePre <buffer> Fmt

let g:gofmt_command = "gofmt -tabs=false -tabwidth=4"



set modeline
" set statusline=%{fugitive#statusline()}
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set scrolloff=5
set cursorline

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
set cscopequickfix=s-,c-,d-,i-,t-,e-

set formatoptions=tcroq
map \fs A /* {{{ */
map \fe A /* }}} */
set fdm=marker

set mouse=nvih
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
let g:solarized_termcolors=256
set background=light
colorscheme solarized
" }}}

" Mapping {{{
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent>  "+y
" }}}
" FileType mapping{{{
autocmd BufRead,BufNewFile *.tt set filetype=tt2
autocmd BufRead,BufNewFile *.gradle set filetype=groovy cin
autocmd BufRead,BufNewFile *.adoc 
	    \ set syntax=asciidoc
" }}}


set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
set grepprg=ack-grep         " replace the default grep program with ack

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window
" displays tabs with :set list & displays when a line runs off-screen
" set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
" set list

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 cin cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 cin cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python setlocal fdm=indent foldlevel=99

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

" Mappings for NerdTree {{{
let NERDTreeIgnore=['\~$', '^obj-*/*', '^*.pyc$']
" }}}
"

let g:syntastic_c_config_file = '.config'
let g:syntastic_cpp_config_file = '.config'
let g:clang_user_options='|| exit 0'
let g:clang_close_preview=1

let g:syntastic_python_checkers= ['pyflakes', 'pep8']
let g:syntastic_python_pep8_args= ''
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:SuperTabDefaultCompletionType = "context"
au BufRead Makefile.inc set ft=make
au BufRead *.stg set fdm=syntax ft=stg

" vim: set fdm=marker : "
