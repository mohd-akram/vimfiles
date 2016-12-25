" Compile and run
if has('win32')
  inoremap <buffer> <F5> <ESC> :!cc -std=c11 "%" -o "%:r.exe" && "%:r"<CR>
  noremap <buffer> <F5> :!cc -std=c11 "%" -o "%:r.exe" && "%:r"<CR>
else
  inoremap <buffer> <F5> <ESC> :!cc -std=c11 "%" -o "%:r" && "./%:r"<CR>
  noremap <buffer> <F5> :!cc -std=c11 "%" -o "%:r" && "./%:r"<CR>
endif
