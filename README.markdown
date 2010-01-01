selfdot
=======

Vim Python filetype plugin for typing `self.` by pressing `.`

Typing `self.` can be annoying, mistyping -- even more.  This plugin lets you
save keystrokes by expanding `.` into `self.` in places where putting a dot
would be a syntax error, i.e. at the beginning of an indented line or right
after an operator.

This project uses [Semantic Versioning][sv] for release numbering.

  [sv]: http://semver.org


Installation
------------

    mkdir -p ~/.vim/ftplugin
    curl -s \
      http://github.com/narfdotpl/selfdot.vim/raw/master/python_selfdot.vim \
      > ~/.vim/ftplugin/python_selfdot.vim

Be sure to have `:filetype plugin on`


Author
------

Maciej Konieczny <hello@narf.pl>
