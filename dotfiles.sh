apps="nvim i3 i3status alacritty gtk-3.0 tmux rofi ranger"
sysConfigFolder="$HOME/.config"
thisFolder="."

if [ -z "${1}" ]; then
  echo "Usage: $0 <command>"
  echo
  echo "Commands:"
  echo "  install   Install the config"
  echo "  update    Update the config"
fi

if [ "$1" = "install" ];then
  for app in $apps; do
    rm -rf $sysConfigFolder/$app
    cp -r $thisFolder/$app $sysConfigFolder
  done

  rm $HOME/.bashrc
  cp $thisFolder/.bashrc $HOME
elif [ "$1" = "update" ];then
  for app in $apps; do
    rm -rf $thisFolder/$app
    cp -r $sysConfigFolder/$app $thisFolder
  done

  rm $thisFolder/.bashrc
  cp $HOME/.bashrc $thisFolder
else 
  echo "Invalid command: $1";
fi
