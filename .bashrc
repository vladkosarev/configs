# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export AWS_VAULT_BACKEND=pass
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export CLR_OPENSSL_VERSION_OVERRIDE=46
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet

export PATH="$HOME/.cargo/bin:$PATH"

export PATH=$PATH:~/.platformio/penv/bin

export PATH=$PATH:~/azure-functions-cli

export PATH=$PATH:/usr/lib/psql12/bin

export PATH=$PATH:/usr/lib/ruby/gems/2.7.0/bin

eval "$(direnv hook bash)"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

#[ -z $DISPLAY ] && export DISPLAY=:0

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

export TERM=xterm-256color
alias la='exa -la'
alias ll='exa -l'
alias ls=exa
alias ..='cd ..'
alias ~='cd ~'
alias d='cd /mnt/c/Dev'
alias o='cd /mnt/c/Dev/OCC'
alias xi='sudo xbps-install -S'
alias xu='sudo xbps-install -Syu'
alias xs='xbps-query -Rs'
alias cat=bat
alias v=vim-huge
alias vim=vim-huge
alias copy='xclip -sel clip'

