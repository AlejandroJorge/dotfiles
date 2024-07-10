#!/bin/bash

sysConfigFolder="$HOME/.config"
thisFolder="."

apps="nvim i3 alacritty gtk-3.0"

for app in $apps; do
  rm -rf $thisFolder/$app
  cp -r $sysConfigFolder/$app $thisFolder
done
