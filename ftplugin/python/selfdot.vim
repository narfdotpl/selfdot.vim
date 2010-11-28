" selfdot.vim
" ===========
"
" Vim plugin that lets you type `self.` by pressing `.` in Python files.
"
" Version:  0.2.1dev
" Website:  https://github.com/narfdotpl/selfdot.vim
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
    let s:prefixes = ['(', '[', '{', '=', '>', '<', '+', '-', '*', '/', '%',
                    \ '&', '|', '^', '~', ',', ';', ':', '@']

    " strip trailing whitespace
    function s:rstrip(string)
        return substitute(a:string, '\s\+$', '', '')
    endfunction

    " return `.` or `self.` depending on context
    function s:DotOrSelfdot()
        " get position
        let x = col('.') - 1
        let y = line('.')

        " don't work inside strings nor comments
        let syntax_item_name = synIDattr(synID(y, x, 0), 'name')
        if syntax_item_name[-6:] == 'String' ||
         \ syntax_item_name[-7:] == 'Comment'
            return '.'
        endif

        " get previous non-whitespace character
        let prev_char = s:rstrip(getline(y)[:x - 1])[-1:]

        " check if current line is continuation
        if prev_char == ''
            let prev_line = s:rstrip(getline(y - 1))
            if prev_line[-1:] == '\'
                " get previous non-whitespace character
                let prev_char = s:rstrip(prev_line[:-2])[-1:]
            else
                return 'self.'
            endif
        endif

        " check if previous character is one of the prefixes
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
