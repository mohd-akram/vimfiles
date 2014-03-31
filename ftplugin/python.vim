" Set indent
setlocal softtabstop=4 shiftwidth=4 expandtab

" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99

" Run Python file
inoremap <silent> <unique> <F5> <ESC> :call Bexec()<CR>
nnoremap <silent> <unique> <F5> :call Bexec()<CR>
