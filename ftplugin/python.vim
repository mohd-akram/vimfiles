" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99

" Run Python file
inoremap <buffer> <silent> <F5> <ESC> :Bexec<CR>
nnoremap <buffer> <silent> <F5> :Bexec<CR>
