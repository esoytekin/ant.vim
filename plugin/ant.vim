if exists("g:ant_run_loaded")
    finish
endif

let g:ant_run_loaded = 1

function! s:searchTarget() abort

    let currentLineNumber = line('.')

    while currentLineNumber > 1

        let currentLine = getline(currentLineNumber)

        if currentLine =~# '</target>'
            return ""
        endif

        let v = matchlist(getline('.'),'^\s*.*target name="\(.\{-\}\)".*$')

        if len(v) > 0 
            return v[1]
        endif
        
        let currentLineNumber = currentLineNumber - 1
        
    endwhile

    return ""

endfunction

function! ant#run() abort

    if &ft != 'ant'
        return
    end

    let targetName = s:searchTarget()

    if empty(targetName)
        echohl WarningMsg | echo "target not found" | echohl None
        retu
    endif

   let choice = confirm("run target '" . targetName . "'", "&OK\n&Cancel", 2)

   if choice == 1
        exe "make " . targetName
   endif

endfunction

