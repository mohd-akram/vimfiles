" vim-plug settings

call plug#begin('~/vimfiles/plugged')

" GitHub repos
Plug 'kchmck/vim-coffee-script'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/vimproc.vim', {'do': 'tools\\update-dll-mingw'}
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neomru.vim'
Plug 'tsukkee/unite-tag'
Plug 'ludovicchabant/vim-gutentags'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'fboender/bexec'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

call plug#end()

" My settings

" Change the color scheme
syntax on
colorscheme gruvbox

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
set lines=45 columns=85
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

" Look for tags
set tags=tags;

" Save backup files in TEMP
set backupdir-=.
set backupdir^=$TEMP

" Run Python snippets
vnoremap <F5> :!python<CR>

" Unite mappings
nnoremap <leader>ua :<C-u>UniteWithProjectDir -start-insert file_rec<CR>
nnoremap <leader>ub :<C-u>Unite buffer<CR>
nnoremap <leader>uf :<C-u>UniteWithProjectDir -start-insert file<CR>
nnoremap <leader>uk :<C-u>Unite -start-insert bookmark<CR>
nnoremap <leader>um :<C-u>UniteWithProjectDir -start-insert file_mru<CR>
nnoremap <leader>uo :<C-u>Unite -start-insert outline<CR>
nnoremap <leader>ut :<C-u>Unite -start-insert tag<CR>
nnoremap <leader>uw :<C-u>Unite window<CR>

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
