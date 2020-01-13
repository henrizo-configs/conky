#!/bin/bash

# Prints the TODO entries from an org agenda file.

cat ~/Dropbox/my_org/todos/todos_main.org                      |
    # Only shows entries containing one of the task related keywords.
    sed -En '/(TODO|DONE|SCHEDULED|DEADLINE)/p'                |
    # Limits the output to the first 30 tasks.
    sed -n '1,30p'                                             |
    # Gets rid of labels
    sed -E 's/\:[a-zA-Z0-9_:áéíóúâêîôûãẽĩõũöäüç ]*\://'        |
    # Changes line colour according to the task state.
    sed 's/TODO/\${color2}[ ]\${color}/;s/DONE/\${color1}[X]/' |
    # Deletes the asterisks in the tasks.
    sed -E 's/\*. //'
