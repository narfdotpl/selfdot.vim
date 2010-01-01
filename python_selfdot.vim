" Vim Python filetype plugin for typing `self.` by pressing `.`
"
" Version:     0.1.0
" Maintainer:  Maciej Konieczny <hello@narf.pl>
" Homepage:    http://github.com/narfdotpl/selfdot.vim
" License:     This file is placed in the public domain.


" don't load twice
if exists('b:loaded_selfdot')
    finish
endif
let b:loaded_selfdot = 1

" make line continuation work with `:set compatible`
let s:save_cpo = &cpo
set cpo&vim


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


" restore cpoptions (`:set compatible` stuff)
let &cpo = s:save_cpo
