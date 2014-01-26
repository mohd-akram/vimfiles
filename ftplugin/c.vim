" Set indent
setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

" Compile and run
inoremap <F5> <ESC> :!cc -Tamd64-coff "%" -Fo"%:r.exe" && "%:r"<CR>
noremap <F5> :!cc -Tamd64-coff "%" -Fo"%:r.exe" && "%:r"<CR>
