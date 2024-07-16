#!/bin/bash

sysConfigFolder="$HOME/.config"
thisFolder="."

apps="nvim i3 i3status alacritty gtk-3.0 tmux"

for app in $apps; do
  rm -rf $sysConfigFolder/$app
  cp -r $thisFolder/$app $sysConfigFolder
done

rm $HOME/.bashrc
cp $thisFolder/.bashrc $HOME
