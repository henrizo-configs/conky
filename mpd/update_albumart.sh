#!/bin/bash

music_path="\/mnt\/myStuff\/music\/"
temp_img_path=~/.config/conky/mpd/temp/mpd_albumart.jpg

while true; do
    # removes current image in the path
    rm $temp_img_path
    # extract current playing song art using ffmpeg
    mpc -f %file% | head -n1 | sed 's/^/\/mnt\/myStuff\/music\//' | xargs -I{} ffmpeg -i {} -an -vcodec copy -y $temp_img_path
    # waits for song to change
    mpc current --wait
done
