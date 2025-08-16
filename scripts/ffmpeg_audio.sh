#!/bin/bash

cd ~/music/avenged-sevenfold_hail_to_the_king/

for mediafile in *.mkv; do
  outputfile="${mediafile%.mkv}.aac"
  
  ffmpeg -i "$mediafile" -vn -acodec copy "$outputfile"
done
