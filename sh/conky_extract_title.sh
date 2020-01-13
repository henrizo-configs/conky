#!/bin/bash 

# Extracts the title from file name
# (considering "Artist - Title").

# Gets playing song file path using MPC.
mpc -f %file%          |
    # MPC prints additional info, only get the line
    # with the file name.
    head -n1           |
    # Deletes the full path, keeping only the file name.
    sed -r 's/^.*\///' |
    # Deletes everything after the '-' (inclusive) character.
    # Then deletes the file extension.
    sed -r 's/^.*- *//;s/\..*//'
