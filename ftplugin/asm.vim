" Compile and run
inoremap <F5> <ESC> :!ml64 "%" /link /subsystem:windows /defaultlib:kernel32.lib /defaultlib:user32.lib /entry:Start && "%:r"<CR>
noremap <F5> :!ml64 "%" /link /subsystem:windows /defaultlib:kernel32.lib /defaultlib:user32.lib /entry:Start && "%:r"<CR>
