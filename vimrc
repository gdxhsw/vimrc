" Gasol Wu <gasol.wu@gmail.com>
" https://github.com/gasol/vimrc

set nocompatible

set t_Co=256
set history=50
set number
set ruler

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gb2312

set modeline
set background=dark
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set incsearch
set hlsearch

syntax on

filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-haml'
Bundle "garbas/vim-snipmate"
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'millermedeiros/vim-statline'
Bundle 'tpope/vim-fugitive'
Bundle 'taglist.vim'
Bundle 'sukima/xmledit'
Bundle 'majutsushi/tagbar'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Gasol/vim-scripts'
Bundle 'Gasol/vim-php'
Bundle 'tpope/vim-cucumber'
set wildignore+=*/vim-php/doc/*
Bundle 'jnwhiteh/vim-golang'
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'gnuchangelog'
Bundle 'sprsquish/thrift.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'Efficient-python-folding'
Bundle 'ervandew/supertab'
Bundle 'YankRing.vim'

" vim-snipmate dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

filetype plugin indent on

" python syntax highlight
let python_highlight_all = 1
let python_sync_slow = 1

" autocomplete
autocmd FileType py setl omnifunc=pythoncomplete
autocmd FileType python syntax keyword pythonDecorator True None False self
autocmd FileType python setl sw=4 ts=4 sts=4 tw=120 sta et nosi
autocmd FileType css setl omnifunc=csscomplete
autocmd FileType perl setl sw=4 ts=4 et
autocmd FileType c setl sw=4 ts=4 et
autocmd BufNewFile,BufRead *.go setl filetype=go sw=4 ts=4
autocmd BufNewFile,BufRead *.mako setl filetype=mako
autocmd BufNewFile,BufRead *.gradle setl filetype=groovy sw=4 ts=4 et
autocmd BufNewFile,BufRead *.thrift if &ft == 'conf' | setl filetype=thrift
autocmd BufNewFile,BufRead *.json setl ft=javascript sw=4 ts=4 et
autocmd BufNewFile,BufRead *.md setl filetype=markdown

let mapleader=","
let g:mapleader=","
nnoremap <silent> <F5> :NERDTree<CR>
map th :tabprev<CR>
map tl :tabnext<CR>
map <C-t><C-t> :tabnew<CR>
map <C-t><C-w> :tabclose<CR>
map <S-H> gT
map <S-L> gt
nmap <leader>/ :nohl<CR>
nnoremap <silent> <F12> :TlistToggle<CR>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv


highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" --- SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" --- TagBar
" toggle TagBar with F7
nnoremap <silent> <F7> :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1

" --- SnipMate
let g:snipMateAllowMatchingDot = 0

let NERDTreeIgnore=['\~$', '\.lo$', '\.la$', '\.pyc']

let Tlist_Use_Right_Window = 1
let os = substitute(system('uname'), "\n", "", "")
if os == "FreeBSD"
	let Tlist_Ctags_Cmd = "/usr/local/bin/exctags"
endif

let g:vundle_default_git_proto = 'git'
let g:changelog_username = 'ccn <ccn@ccn.tw>'

if filereadable($HOME.'/.vimrc_local')
	source $HOME/.vimrc_local
endif

comm! W exec 'w !sudo tee % > /dev/null' | e!
