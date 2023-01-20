#!/bin/sh

bar_sts=/tmp/bar_sts
if [ ! -f "$bar_sts" ]; then
  eww open bar
  echo "on" > "$bar_sts"
fi

case $(cat "$bar_sts") in 
  on)
    eww close bar
    echo off > $bar_sts
    ;;
  off)
    eww open bar
    echo on > $bar_sts
    ;;
esac

