if exists('b:loaded_selfdot')
    finish
endif
let b:loaded_selfdot = 1


let s:PREFIXES = [' ', '\t', '(', '[', '{', '=', '>', '<', '+', '-', '*', '/',
                \ '%', '&', '|', '~', ',', ':', "'", '"', '`', '@', ';', '#']


function s:DotToSelfdot()
    let prev_char = getline('.')[col('.') - 2]

    for prefix in s:PREFIXES
        if prev_char == prefix
            return 'self.'
        endif
    endfor

    return '.'
endfunction


inoremap <buffer> <expr> . <SID>DotToSelfdot()
