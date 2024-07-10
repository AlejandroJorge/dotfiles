#!/bin/bash

sysConfigFolder="$HOME/.config"
thisFolder="."

apps="nvim i3 i3status alacritty gtk-3.0"

for app in $apps; do
  rm -rf $sysConfigFolder/$app
  cp -r $thisFolder/$app $sysConfigFolder
done
