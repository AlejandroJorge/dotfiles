#
# ~/.bash_profile
#

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec Hyprland
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Created by `pipx` on 2025-10-06 12:24:56
export PATH="$PATH:/home/ramza/.local/bin"
