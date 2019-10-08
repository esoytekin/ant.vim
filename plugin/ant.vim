if exists("g:ant_run_loaded")
    finish
endif

let g:ant_run_loaded = 1

function! ant#run() abort
    if &ft != 'ant'
        return
    end
    let v = matchlist(getline('.'),'^\t.*target name="\(.\{-\}\)".*$')
    let targetName = v[1]
    if empty(targetName)
        retu
    end
    sil exe "make " . targetName
endfunction

