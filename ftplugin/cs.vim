" Set indent
setlocal softtabstop=4 shiftwidth=4 expandtab

" Compile and run
inoremap <buffer> <F5> <ESC> :!csc /nologo "%" && "%:r"<CR>
noremap <buffer> <F5> :!csc /nologo "%" && "%:r"<CR>
