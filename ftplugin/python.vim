" Set indent
setlocal softtabstop=4 shiftwidth=4 expandtab

" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99

" Run Python file
inoremap <silent> <F5> <ESC> :Bexec<CR>
nnoremap <silent> <F5> :Bexec<CR>

let g:IDEMode = 0

" Setup IDE
if !exists('*<SID>Python_IDE')
  fun! <SID>Python_IDE()
    if !g:IDEMode
      let g:prevLines = &lines
      let g:prevColumns = &columns
    else
      TagbarClose
      NERDTreeClose
      BexecCloseOut
      MBEClose
      let &lines = g:prevLines
      let &columns = g:prevColumns
      let g:IDEMode = 0
      return
    endif

    let g:tagbar_left = 1
    let g:miniBufExplSplitToEdge = 0

    " Resize Vim window
    set lines=46 columns=189

    " Add left sidebar
    TagbarOpen
    NERDTree
    wincmd J
    wincmd k
    wincmd l
    wincmd L

    " Resize left sidebar
    wincmd h
    resize 21
    vertical resize 30
    wincmd l

    " Add right sidebar
    Bexec
    wincmd x
    vertical resize 72
    wincmd h

    " Show buffer explorer
    MBEOpen

    let g:IDEMode = 1
  endfun
endif

" Switch to IDE Mode
nnoremap <silent> <F2> :call <SID>Python_IDE()<CR>
inoremap <silent> <F2> <ESC> :call <SID>Python_IDE()<CR>
