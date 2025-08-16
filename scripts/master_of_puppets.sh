cd ~/doom-ascii/doom_ascii/iwad/

for d in $(find ~/doom-ascii/doom_ascii/iwad -maxdepth 1 -type d)
do
  mv * ~/doom-ascii/doom_ascii/
  echo $d
done 
