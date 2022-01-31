#!/bin/bash

userresources=$HOME/.config/.Xresources
usermodmap=$HOME/.config/.Xmodmap

# merge in defaults and keymaps

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#        [ -x "$f" ] && . "$f"
#    done
#    unset f
#fi

export _JAVA_AWT_WM_NONREPARENTING=1

setxkbmap -layout dvorak &
setxkbmap -option caps:escape &
feh --no-fehbg --bg-center ~/.cache/wallpaper &
~/bin/statusBar &
numlockx &
exec dwm
