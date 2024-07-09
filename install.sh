#!/bin/bash

sysConfigFolder="$HOME/.config"
thisFolder="."

apps="nvim i3 alacritty"

for app in $apps; do
  rm -rf $sysConfigFolder/$app
  cp -r $thisFolder/$app $sysConfigFolder
done
