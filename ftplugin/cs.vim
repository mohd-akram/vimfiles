" Compile and run
inoremap <buffer> <F5> <ESC> :!csc /nologo "%" && "%:r"<CR>
noremap <buffer> <F5> :!csc /nologo "%" && "%:r"<CR>
