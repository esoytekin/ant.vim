if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

let &l:makeprg='ant -f ' . fnameescape(expand("%"))
nnoremap <silent> <buffer> <Plug>RunAntTarget
\       :call ant#run()<CR>
nmap R <Plug>RunAntTarget
let &cpo = s:save_cpo
