#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2025-10-06 12:24:56
export PATH="$PATH:/home/ramza/.local/bin"

# go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# nvim
export EDITOR='nvim'
alias vi=nvim
alias vim=nvim

# some alias
alias cat=bat
