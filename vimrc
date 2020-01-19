" Enable the basics
filetype plugin indent on
syntax enable

" Change the color scheme, font and remove GUI options
if has('gui_running')
  packadd vim-colors_atelier-schemes
  colorscheme Atelier_SulphurpoolDark
  set background=dark
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

" Set comment options
set commentstring=#%s
let NERDSpaceDelims = 1
packadd nerdcommenter

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

" Add code runner
let bexec_splitdir = 'ver'
let bexec_outputmode = 'append'
packadd bexec

" Add statusline
if has('gui_running')
  let g:airline_powerline_fonts = 1
  let g:airline_theme = colors_name
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
packadd vim-airline

" Add autocomplete
autocmd InsertEnter * call deoplete#enable()
packadd nvim-yarp
packadd vim-hug-neovim-rpc
packadd deoplete.nvim

" Remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Package update helper
function! PackUpdate() abort
  packadd minpac
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  " GitHub repos
  let opts = {'type': 'opt'}
  call minpac#add('scrooloose/nerdcommenter', opts)
  call minpac#add('fboender/bexec', opts)
  call minpac#add('vim-airline/vim-airline', opts)
  call minpac#add('atelierbram/vim-colors_atelier-schemes', opts)
  call minpac#add('Shougo/deoplete.nvim', opts)
  call minpac#add('roxma/nvim-yarp', opts)
  call minpac#add('roxma/vim-hug-neovim-rpc', opts)
  call minpac#add('Yggdroot/indentLine', opts)
  call minpac#add('scrooloose/syntastic', opts)
  call minpac#add('SirVer/ultisnips', opts)
  call minpac#add('honza/vim-snippets', opts)
  call minpac#add('airblade/vim-gitgutter', opts)
  call minpac#add('ludovicchabant/vim-gutentags', opts)
  call minpac#add('kchmck/vim-coffee-script', opts)
  call minpac#add('davidhalter/jedi-vim', opts)
  call minpac#add('rust-lang/rust.vim', opts)
  call minpac#update()
  call minpac#clean()
endfunction

" Packages
packadd indentLine
packadd syntastic
packadd ultisnips
packadd vim-snippets
packadd vim-gitgutter
packadd vim-gutentags
packadd vim-coffee-script
packadd jedi-vim
packadd rust.vim
