#!/usr/bin/env python
# encoding: utf-8
"""
Find last character of "self." prefixes found in Python files in
`codebase/` directory (i.e. find "+" in "foo+self.bar").

Ignore prefixes that can be variable names (i.e. ignore "myself.").
Print table of character occurrence.
"""

from operator import itemgetter
from os import walk
from os.path import dirname, join, realpath
from re import compile, findall
from sys import stdout


__author__ = 'Maciej Konieczny <hello@narf.pl>'


def read_python_files_from_directory(directory):
    """
    Find all .py files in directory and yield them line by line.

    Draw progress bar.
    """

    # count files
    number_of_files = 0
    for root, dirs, files in walk(directory):
        for filename in files:
            if filename.endswith('.py'):
                number_of_files += 1

    if number_of_files == 0:
        raise IOError('\n'.join([
            'No Python files found in "{0}" directory.'.format(directory),
            '',
            'Put there some Python code from:',
            ' - http://python.org/download/',
            ' - http://mercurial.selenic.com/downloads/',
            ' - http://djangoproject.com/download/',
            ' - etc.'
        ]))

    # set progress bar
    length = 20
    i = 0
    done_before = -1

    for root, dirs, files in walk(directory):
        for filename in files:
            if filename.endswith('.py'):
                # draw progress bar
                i += 1
                done = int(round(float(i) / number_of_files * length))
                if done_before != done:
                    done_before = done
                    progress_bar = ''.join([
                        '\r[',
                        '#' * done,
                        ' ' * (length - done),
                        ']'
                    ])
                    stdout.write(progress_bar)
                    stdout.flush()

                # read file
                filepath = join(root, filename)
                with open(filepath) as f:
                    for line in f:
                        yield line

    # remove progress bar
    stdout.write('\r' + ' ' * len(progress_bar) + '\r')
    stdout.flush()


def _main():
    pattern = compile(r'(\W)self\.')
    results = {}  # what a terrible name!
    directory = join(realpath(dirname(__file__)), 'codebase')

    for line in read_python_files_from_directory(directory):
        for prefix in findall(pattern, line):
            results[prefix] = results.get(prefix, 0) + 1

    for prefix, quantity in sorted(
        results.items(),
        key=itemgetter(1),
        reverse=True
    ):
        print '{0:4} {1:6}'.format(repr(prefix), quantity)

if __name__ == '__main__':
    _main()
