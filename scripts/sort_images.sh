#!/bin/bash

cd ~/Downloads/

for f in *.jpeg; do

  ffmpeg -i "$f" "${f%.*}.png"; 
done

