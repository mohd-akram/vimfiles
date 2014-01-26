" Set indent
setlocal softtabstop=4 shiftwidth=4 expandtab

" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99

" Run Python file
inoremap <F5> <ESC> :!"%"<CR>
nnoremap <F5> :!"%"<CR>
