" selfdot.vim
" ===========
"
" Vim plugin that lets you type `self.` by pressing `.` in Python files.
"
" Version:  0.2.3dev
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
    " list characters that can precede `self.`
    let s:selfdot_chars = ['(', '[', '{', '=', '>', '<', '+', '-', '*', '/',
                         \ '%', '&', '|', '^', '~', ',', ';', ':', '@']

    " return `.` or `self.` depending on context
    function s:DotOrSelfdot()
        " get cursor position
        let x = col('.') - 1
        let y = line('.')

        " is cursor at string or comment?
        let syntax_item_name = synIDattr(synID(y, x, 0), 'name')
        if syntax_item_name == 'pythonString' ||
         \ syntax_item_name == 'pythonComment'
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

        " is `p` one of characters that can precede `self.`?
        if index(s:selfdot_chars, p) >= 0
            return 'self.'
        endif

        return '.'
    endfunction
endif

" map magic to dot key
inoremap <buffer> <expr> . <SID>DotOrSelfdot()

" restore cpoptions (`:set compatible` stuff)
let &cpo = s:saved_cpo
