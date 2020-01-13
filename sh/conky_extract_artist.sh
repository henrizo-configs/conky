#!/bin/bash

# Extracts the artist from file name
# (considering "Artist - Title").

# Gets playing song file path using MPC.
mpc -f %file%          |
    # MPC prints additional info, only get the line
    # with the file name.
    head -n1           |
    # Deletes the full path, keeping only the file name.
    sed -r 's/^.*\///' |
    # Deletes everything before the '-' (inclusive) character.
    sed -r 's/-.*//'
