" vim-plug settings

call plug#begin('~/' . (has('win32') ? 'vimfiles' : '.vim') . '/plugged')

" GitHub repos
Plug 'kchmck/vim-coffee-script'
Plug 'rust-lang/rust.vim'
Plug 'davidhalter/jedi-vim'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'atelierbram/vim-colors_atelier-schemes'
Plug 'morhetz/gruvbox'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', {'do': has('win32') ? 'tools\\update-dll-mingw' :
                                               \ 'make'}

call plug#end()

" My settings

" Change the color scheme
syntax on
colorscheme base16-ateliersulphurpool
set background=dark

" Change the font and remove GUI options
if has('gui_running')
  if has('win32')
    set guifont=Fantasque\ Sans\ Mono:h12
  else
    set guifont=Fantasque\ Sans\ Mono:h14
  endif
  set guioptions=
  if has('directx')
    set renderoptions=type:directx,renmode:5
  endif
endif

" Disable beeps
set visualbell

" Switch buffers without saving
set hidden

" Set encoding
set encoding=utf-8

" Show line numbers and cursor information
set number
set ruler

" Show staus line
set laststatus=2

" Set number of lines, columns and colorcolumn
if has('gui_running')
  set lines=45 columns=85
endif
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
nnoremap <leader>uf :<C-u>Unite -start-insert file<CR>
nnoremap <leader>uk :<C-u>Unite -start-insert bookmark<CR>
nnoremap <leader>um :<C-u>Unite -start-insert file_mru<CR>
nnoremap <leader>uo :<C-u>Unite -start-insert outline<CR>
nnoremap <leader>ut :<C-u>Unite -start-insert tag<CR>
nnoremap <leader>uw :<C-u>Unite window<CR>

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

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
