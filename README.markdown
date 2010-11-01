selfdot.vim
===========

Vim plugin that lets you type `self.` by pressing `.` in Python files.

Typing `self.` can be annoying, mistyping -- even more.  This plugin
lets you save keystrokes by expanding `.` into `self.` in places where
putting a dot is a syntax error (e.g. at the beginning of an indented
line or right after an operator).  Plugin is disabled in strings and
comments in order for you to be able to type `cd ..` and stay sane.


Installation
------------

    mkdir -p ~/.vim/ftplugin/python
    cd !$
    curl -O http://github.com/narfdotpl/selfdot.vim/raw/master/selfdot.vim

Be sure to have `:filetype plugin on`


Meta
----

selfdot.vim is written by [Maciej Konieczny][].  This software is
released into the [public domain][] and uses [semantic versioning][] for
release numbering.

  [Maciej Konieczny]: http://narf.pl/
  [public domain]: http://unlicense.org/
  [semantic versioning]: http://semver.org/
