" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99

" Compile code
inoremap <buffer> <F5> <ESC> :make -m<CR>
noremap <buffer> <F5> :make -m<CR>
