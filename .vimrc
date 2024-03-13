set whichwrap=b,s,<,>,[,]
set clipboard=unnamedplus
set number

augroup python_autocommands
  autocmd!
  autocmd BufWritePost *.py :silent! %s|^#!/usr/bin/env python$|#!/usr/bin/env python|e | silent! !chmod +x %
augroup END

" Change the color of line numbers
highlight LineNr ctermfg=3

augroup filetype_highlight
  autocmd!
  autocmd FileType * highlight Statement ctermfg=2
augroup END

syntax on

if has("vms")
  set nobackup " do not keep a backup file, use versions instead
else
  set backup   " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile " keep an undo file (undo changes after closing)
  endif
endif

augroup text_file_autocommands
  au!
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

