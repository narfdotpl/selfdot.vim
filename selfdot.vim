" selfdot.vim
" ===========
"
" Vim plugin that lets you type `self.` by pressing `.` in Python files.
"
" Version:  0.2.0dev
" Website:  http://github.com/narfdotpl/selfdot.vim
" License:  public domain <http://unlicense.org/>
" Author:   Maciej Konieczny <hello@narf.pl>


" don't load twice
if exists('b:is_selfdot_loaded')
    finish
endif
let b:is_selfdot_loaded = 1

" make line continuation work with `:set compatible`
let s:saved_cpo = &cpo
set cpo&vim

" don't define twice
if !exists('*s:DotOrSelfdot')
    " list valid `self.` prefixes
    let s:prefixes = [' ', "\t", '(', '[', '{', '=', '>', '<', '+', '-', '*',
                    \ '/', '%', '&', '|', '~', ',', ';', ':', '@', '`', '#']

    " define magic
    function s:DotOrSelfdot()
        " get position
        let x = col('.') - 1
        let y = line('.')

        " check if previous character is one of the prefixes
        let prev_char = getline(y)[x - 1]
        for prefix in s:prefixes
            if prev_char == prefix
                return 'self.'
            endif
        endfor

        " return dot if check failed
        return '.'
    endfunction
endif

" map magic to dot key
inoremap <buffer> <expr> . <SID>DotOrSelfdot()

" restore cpoptions (`:set compatible` stuff)
let &cpo = s:saved_cpo
