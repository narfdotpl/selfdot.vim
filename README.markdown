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

### In a Nutshell

Put `selfdot.vim` in `~/.vim/ftplugin/python` (be sure to have
`:filetype plugin on`).


### Without Fuss

    mkdir -p ~/.vim/ftplugin/python
    cd !$
    curl -O https://github.com/narfdotpl/selfdot.vim/raw/master/ftplugin/python/selfdot.vim


### With [Pathogen][]

    mkdir -p ~/.vim/bundle/selfdot/ftplugin/python
    cd !$
    curl -O https://github.com/narfdotpl/selfdot.vim/raw/master/ftplugin/python/selfdot.vim


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
