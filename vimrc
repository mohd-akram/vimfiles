" Vundle settings

set nocompatible
filetype off

set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc('$HOME/vimfiles/bundle/')

Bundle 'gmarik/vundle'

" Bundles

" GitHub repos
Bundle 'kchmck/vim-coffee-script'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Yggdroot/indentLine'
Bundle 'zah/nimrod.vim'

" Vim scripts
Bundle 'L9'
Bundle 'mru.vim'

filetype plugin indent on

" My settings

" Change the color scheme
syntax on
colorscheme Tomorrow-Night

" Change the font and remove GUI options
if has('gui_running')
  set guifont=Menlo:h10
  set guioptions=
endif

" Set directory to that of current file
set autochdir

" Set indent
set autoindent
set softtabstop=2 shiftwidth=2 expandtab

" Set search options
set incsearch
set hlsearch

" Show line numbers and cursor information
set number
set ruler

" Set number of lines and columns
set lines=40 columns=83

" Set encoding
set encoding=utf-8

" Save backup files in TEMP
set backupdir-=.
set backupdir^=$TEMP

" Run Python snippets
vnoremap <F5> :!python<CR>

" Save MRU file in TEMP
let MRU_File = $TEMP . '\_vim_mru_files'

" Enable autocomplete
let g:neocomplcache_enable_at_startup = 1

" Show bookmarks in NERDTree
let NERDTreeShowBookmarks = 1

" Enable Markdown for .md files
au BufRead,BufNewFile *.md set filetype=markdown

" Remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
