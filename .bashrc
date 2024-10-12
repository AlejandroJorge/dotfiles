# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;  # Continue if interactive
    *) return;;
esac

# History settings
HISTCONTROL=ignoreboth    # Ignore duplicate lines or lines starting with space
shopt -s histappend       # Append to history file, don't overwrite
HISTSIZE=1000             # Max number of commands to remember in history
HISTFILESIZE=2000         # Max size of history file

# Automatically update window size after each command
shopt -s checkwinsize

# Set variable identifying the chroot (used in the prompt)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Enable color prompt if the terminal supports it
case "$TERM" in
    xterm-color|*-256color|alacritty) color_prompt=yes ;;
esac

# Git branch function
parse_git_branch() {
  git symbolic-ref --short HEAD 2>/dev/null
}

# Set prompt with Gruvbox colors
if [ "$color_prompt" = yes ]; then
    PS1='\[\e]0;\u@\h: \w\a\]'   # Title bar
    PS1+='\[\033[01;38;5;223m\]🕒 \t '   # Time (Gruvbox Yellow)
    PS1+='\[\033[01;38;5;214m\]\u@\h '   # User@Host (Gruvbox Orange)
    PS1+='\[\033[01;38;5;108m\]\w\n'     # Working directory (Gruvbox Green)
    PS1+='\[\033[01;38;5;167m\]$(parse_git_branch 2>/dev/null) '  # Git branch (Gruvbox Red)
    PS1+='\[\033[01;38;5;167m\]>\[\033[00m\] '  # End prompt
else
    PS1='\t \u@\h \w $(parse_git_branch) > '
fi
unset color_prompt

# Enable color support for ls and add aliases
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b ~/.dircolors 2>/dev/null || dircolors -b)"
    alias ls='ls --color=auto'
fi

# GCC colors for warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Source custom aliases if they exist
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable bash completion if available
if ! shopt -oq posix; then
  [ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
fi

# Add directories to PATH
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.idea/bin:$HOME/.zig"

# fnm (Fast Node Manager) setup
if [ -d "$HOME/.local/share/fnm" ]; then
    export PATH="$HOME/.local/share/fnm:$PATH"
    eval "$(fnm env)"
fi

# pnpm setup
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;  # Do nothing if already in PATH
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Set GOPATH for Go
export GOPATH=$HOME/.go

# Aliases
alias vim="nvim"
alias tmux="TERM=xterm-256color tmux"

# Autocompletion for Angular CLI
source <(ng completion script)
