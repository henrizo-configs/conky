#!/bin/bash

# Takes the emacs' org-mode agenda output and keeps only the essential information.

# Emacs command that displays the org-mode agenda for the current week.
emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda "a" 
                                           org-agenda-span (quote week)
                                           org-agenda-use-time-grid nil
                                           org-agenda-hide-tags-regexp "*\\|")' |
    # Limits the output to 50 lines.
    sed -n '2,51p'                                                              |
    # Substitutes '$' to 'S' to avoid conky interpreting non-variables.
    sed 's/\$/S/'                                                               |
    # Takes away agenda header.
    tail -n +1                                                                  |
    # Takes away the day of the week name, the month and the year and keeps only the day number.
    # e.g.: "Sunday     12 January 2020" -> "12"
    sed -E "s/^((M|T|W|F|S)[ a-zA-Z]*) *([0-9]*).*/\3/"                         |
    # Excludes the habits from being showed.
    sed "/my_habits:/d"                                                         |
    # Excludes the "my_agenda" label.
    sed -E "s/my_agenda: *//"                                                   |
    # Excludes the "Scheduled:" information text.
    sed -E "s/Scheduled: *//"                                                   |
    # Matches the task scheduled time and makes it cleaner.
    # e.g.: "20:00...... A very cool event scheduled for 20:00" becomes
    #       "20:00 - A very cool event scheduled for 20:00" becomes
    sed -E "s/([0-9]*:[0-9]*)\.* /\1 - /"                                       |
    # Gets rid of days that do not have associated events. Try running everything without this
    # line if you need to see what it does.
    sed -En ':a;N;$s/.*/&\nEOF/;$!ba;s/([0-9]+\n)*(([0-9]+)|(EOF))/\3/g;p'      |
    # Highlights current day.
    sed -E "s/($(date +"%d"))/\${color2}\1\${color}/"                           |
    # Changes line colour according to the task state.
    sed -E 's/(WENT|MISSED)/\${color1}&\${color}/'

