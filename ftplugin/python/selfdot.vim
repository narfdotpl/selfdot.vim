" selfdot.vim
" ===========
"
" Vim plugin that lets you type `self.` by pressing `.` in Python files.
"
" Version:  0.2.1
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

    " return `.` or `self.` depending on context
    function s:DotOrSelfdot()
        " get cursor position
        let x = col('.') - 1
        let y = line('.')

        " is cursor at string or comment?
        let syntax_item_name = synIDattr(synIDtrans(synID(y, x, 0)), 'name')
        if syntax_item_name == 'String' ||
         \ syntax_item_name == 'Comment'
            return '.'
        endif

        " p := previous NWC (non-whitespace character)
        let [p_y, p_x] = searchpos('\v[^ \t]', 'bn', 1)
        let p = getline(p_y)[p_x - 1]

        " is `p` on current line?
        if p_y < y
            if p != '\'
                return 'self.'
            endif

            " p := previous NWC that is not '\'
            let [p_y, p_x] = searchpos('\v[^\\ \t]', 'bn', 1)
            let p = getline(p_y)[p_x - 1]
        endif

        " is `p` part of statement keyword?
        if synIDattr(synIDtrans(synID(p_y, p_x, 0)), 'name') == 'Statement'
            return 'self.'
        endif

        " is `p` one of prefixes?
        for prefix in s:prefixes
            if p == prefix
                return 'self.'
            endif
        endfor
        return '.'
    endfunction
endif

" map magic to dot key
inoremap <buffer> <expr> . <SID>DotOrSelfdot()

" restore cpoptions (`:set compatible` stuff)
let &cpo = s:saved_cpo
