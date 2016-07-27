" Set indent
setlocal softtabstop=2 shiftwidth=2 expandtab

" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99

" Compile code
inoremap <buffer> <F5> <ESC> :make -m<CR>
noremap <buffer> <F5> :make -m<CR>
