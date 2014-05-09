" Vundle settings

set nocompatible
filetype off

set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc('~/vimfiles/bundle/')

Plugin 'gmarik/vundle'

" Plugins

" GitHub repos
Plugin 'kchmck/vim-coffee-script'
Plugin 'zah/nimrod.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim'}

" Other repos
Plugin 'https://bitbucket.org/fboender/bexec.git'

filetype plugin indent on

" My settings

" Change the color scheme
syntax on
colorscheme Tomorrow-Night

" Change the font and remove GUI options
if has('gui_running')
  set guifont=Menlo\ for\ Powerline:h10
  set guioptions=
endif

" Set encoding
set encoding=utf-8

" Show line numbers and cursor information
set number
set ruler

" Show staus line
set laststatus=2

" Set number of lines, columns and colorcolumn
set lines=40 columns=83
set colorcolumn=80

" Set indent
set autoindent
set softtabstop=2 shiftwidth=2 expandtab

" Set split options
set splitright
set splitbelow

" Set search options
set incsearch
set hlsearch

" Set directory to that of current file
set autochdir

" Save backup files in TEMP
set backupdir-=.
set backupdir^=$TEMP

" Run Python snippets
vnoremap <F5> :!python<CR>

" Unite mappings
nnoremap <leader>u :<C-u>Unite -no-split<CR>
nnoremap <leader>a :<C-u>Unite -no-split -start-insert file_rec<CR>
nnoremap <leader>b :<C-u>Unite -no-split buffer<CR>
nnoremap <leader>f :<C-u>Unite -no-split -start-insert file<CR>
nnoremap <leader>k :<C-u>Unite -no-split bookmark<CR>
nnoremap <leader>m :<C-u>Unite -no-split -start-insert file_mru<CR>
nnoremap <leader>t :<C-u>Unite -no-split tab<CR>
nnoremap <leader>w :<C-u>Unite -no-split window<CR>

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Bexec settings
let bexec_splitdir = 'ver'
let bexec_outputmode = 'append'

" Set jedi Python version
let g:jedi#force_py_version = 3

" Enable autocomplete
let g:neocomplete#enable_at_startup = 1
autocmd FileType python NeoCompleteLock

" CoffeeTags settings
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

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
