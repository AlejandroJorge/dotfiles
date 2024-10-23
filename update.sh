#!/bin/bash

apps="nvim i3 i3status alacritty gtk-3.0 tmux rofi ranger"

sysConfigFolder="$HOME/.config"
thisFolder="."

for app in $apps; do
  rm -rf $thisFolder/$app
  cp -r $sysConfigFolder/$app $thisFolder
done

rm $thisFolder/.bashrc
cp $HOME/.bashrc $thisFolder
