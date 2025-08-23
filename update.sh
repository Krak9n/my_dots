#!/bin/bash

# script executes every thirty minutes
# used as systemd timer

git_remote="https://github.com/Krak9n/dotfiles"
suck="$HOME/stuff/my_dots/config/"
paths="$HOME/dots_backup.conf"
the_path="\e[1A\e[K"

# giving permissions 
chmod +x update.sh

echo "startin copying"

backing_needed_dots() { 
  sed '/^[ \t]*$/d' $paths | while read filePath; do
    echo -e "$THE_LINE Copying $filePath"

    # find & replace for ~ with home path
    findThis="~/"
    replaceWith="$HOME/"
    originalFile="${filePath//${findThis}/${replaceWith}}"

    # copying the files
    cp --recursive $originalFile ./config/
    sleep 0.05
  done
}

# for the case if u calling by a function
# Check if the function exists (bash specific)
if declare -f "$1" > /dev/null
then
  # call arguments verbatim
  "$@"
else
  # Show a helpful error
  echo "'$1' is not a known function name" >&2
  exit 1
fi

push_changes() {
  git -C config add .
  git -C config commit -m "updating dots"

  git -C config push origin main
}

echo "done copying"
