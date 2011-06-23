selfdot.vim
===========

Vim plugin that lets you type `self.` by pressing `.` in Python files.

Typing `self.` can be annoying, mistyping -- even more.  This plugin
lets you save keystrokes by expanding `.` into `self.` in places where
putting a dot is usually a syntax error (e.g. right after `if`).
selfdot recognizes conditionals, operators, line continuations, etc.  It
tries not to get in your way and is disabled inside strings and comments
(so you can type `cd ..` and stay sane).  Code-awareness relies heavily
on syntax item names defined in [default Python syntax file][syntax], so
if you're using something else, selfdot might not work.

  [syntax]: http://code.google.com/p/vim/source/browse/runtime/syntax/python.vim


Installation
------------

### In a Nutshell

Put `selfdot.vim` in `~/.vim/ftplugin/python` and be sure to have
`:filetype plugin on`.


### With Bare Hands

    mkdir -p ~/.vim/ftplugin/python
    cd !$
    curl -O https://raw.github.com/narfdotpl/selfdot.vim/master/ftplugin/python/selfdot.vim


### With [Pathogen][] and [Git][vimcast]

You know what to do.

  [pathogen]: https://github.com/tpope/vim-pathogen
  [vimcast]: http://vimcasts.org/e/27


Meta
----

selfdot.vim is written by [Maciej Konieczny][].  This software is
released into the [public domain][] and uses [semantic versioning][] for
release numbering.

  [Maciej Konieczny]: http://narf.pl/
  [public domain]: http://unlicense.org/
  [semantic versioning]: http://semver.org/
