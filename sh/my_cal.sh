#!/bin/bash

# Prints aligned cal for current month, highlighting today as [x].

# Gets how many days there are in the first week.
first_week_days=$(cal | sed -n "3,3p" | wc -w)
# Counts how many cells in the calendar's first week are blank.
blank_days=$((-1 * ($first_week_days - 7)))
# Generates a filler, filling the blank cells with a '#'.
# This is needed for the alignment
filler=$(perl -e "print ('# ' x $blank_days)")
# Outputs cal for current month                                          |
# highligths "today" as "[today]", using sed substitution                | 
# substitutes the first week like with the filler pattern plus the line,
# filling in the blank cells                                             |
# columnates everything, right-aligning in all columns                   | 
# gets rid of the filler pattern
cal | tail -n +2 | sed -E "s/($(date +"%d"))/[\1]/" | sed -E "2s/.*/$filler&/"| column -tR "1,2,3,4,5,6,7" | sed -E "y/#/ /"
