#!/bin/sh

for i in *.avi; do ffmpeg -i "$i" -movflags faststart "${i%.avi}.mp4";done
