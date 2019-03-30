"set cin
filetype indent on

set sw=4
set softtabstop=4
set et
set nu

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" NerdTree {{{
map <leader>n :NERDTreeToggle<CR>
" close NerdTree when you open a file

nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let NERDTreeIgnore = ['\.pyc$', '.pb.*']
" }}}

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

set guifont=inconsolata\ 12
set guioptions-=m
set guioptions-=M
set guioptions-=T
" Load pathogen with docs for all plugins {{{
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
" }}}

" {{{ General Customizations
" set columns=80

set modeline
" set statusline=%{fugitive#statusline()}
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set scrolloff=5
set cursorline

let c_space_errors=1
set cmdheight=1
set textwidth=78 shiftwidth=4 et
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

" }}}

" Colorscheme {{{
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized
" }}}

" Configure YouCompleteMe {{{
" ---------------------------------- "
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>
" }}}

" Ultisnips {{{
let g:UltiSnipsSnippetsDir="~/.vim/mysnips"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnips']

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" }}}

" Syntastic {{{
let g:syntastic_python_python_exec = 'python3'  " support python3 syntax 
let g:syntastic_python_checkers = ['flake8']
" }}}

" python mappings
au BufNewFile,BufRead *.py set ts=4 sts=4 sw=4 tw=79 et ai fileformat=unix
    \ fdm=indent
    \ foldlevel=2

" Fuzzyfinder {{{
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>
" }}}

" {{{go plugin
au BufNewFile,BufRead *.go set ts=4 sw=4 tw=79 ai fileformat=unix
    \ fdm=indent
    \ foldlevel=3


" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
" }}}

" {{{ ack config
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1
let g:ack_use_dispatch = 0
" }}}

" {{{ ctrlp config
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" }}}

let mapleader=","
map <Leader>s :CSearch <cword><CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*_pb2.py,*/dist/*,*/packages/*,*/build/*
set wildignore+=*.class
