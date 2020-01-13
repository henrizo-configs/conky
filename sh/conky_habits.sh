#!/bin/bash

# Prints the habits for today from org-mode agenda.

emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda "a"
                                           org-agenda-span (quote day)
                                           org-habit-graph-column 60
                                           org-agenda-hide-tags-regexp "*\\|")' |
    # Takes away agenda header.
    tail -n +4                                                                  |
    # Extract only habits.
    grep "my_habits:"                                                           |
    # Substitutes TODO by a pretty box.
    sed -E 's/TODO/\${color2}[ ]\${color}/'                                     |
    # Excludes the habits file-tag from being showed and corrects indentation.
    sed -E "s/ *my_habits: *//"
