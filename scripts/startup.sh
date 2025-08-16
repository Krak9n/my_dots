#!/bin/bash

### AIN'T FINISHED

# quite
i3-msg "workspace number 1; exec zen-browser"
#i3-msg "workspace number 1; exec kitty"

i3-msg "workspace number 3; [class=Kitty] focus; exec --no-startup-id xdotool type 'nvim'"
#running spotify
i3-msg "workspace number 2; exec.com.spotify"

i3-msg "workspace number 4; exec discord"
#kitty
#i3-msg "workspace 3; kitty"
