" Set indent
setlocal softtabstop=4 shiftwidth=4 expandtab

" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99

" Run Python file
inoremap <buffer> <silent> <F5> <ESC> :Bexec<CR>
nnoremap <buffer> <silent> <F5> :Bexec<CR>
