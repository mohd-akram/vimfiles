" Compile and run
if has('win64')
  inoremap <buffer> <F5> <ESC> :!ml64 "%" /link /subsystem:windows /defaultlib:kernel32.lib /defaultlib:user32.lib /entry:Start && "%:r"<CR>
  noremap <buffer> <F5> :!ml64 "%" /link /subsystem:windows /defaultlib:kernel32.lib /defaultlib:user32.lib /entry:Start && "%:r"<CR>
endif
