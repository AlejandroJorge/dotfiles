#!/bin/bash

sysConfigFolder="$HOME/.config"
thisFolder="."

apps="nvim i3 alacritty"

for app in $apps; do
  rm -rf $thisFolder/$app
  cp -r $sysConfigFolder/$app $thisFolder
done
