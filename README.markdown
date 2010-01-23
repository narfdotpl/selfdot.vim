selfdot.vim
===========

Python filetype plugin for typing `self.` by pressing `.`

Typing `self.` can be annoying, mistyping -- even more.  This plugin
lets you save keystrokes by expanding `.` into `self.` in places where
putting a dot would be a syntax error, i.e. at the beginning of an
indented line or right after an operator.


Installation
------------

    mkdir -p ~/.vim/ftplugin
    curl -s \
      http://github.com/narfdotpl/selfdot.vim/raw/master/python_selfdot.vim \
      > ~/.vim/ftplugin/python_selfdot.vim

Be sure to have `:filetype plugin on`


Meta
----

selfdot.vim is written by [Maciej Konieczny][].  This software is
released into the [public domain][] and uses [semantic versioning][] for
release numbering.

  [Maciej Konieczny]: http://narf.pl/
  [public domain]: http://unlicense.org/
  [semantic versioning]: http://semver.org/
