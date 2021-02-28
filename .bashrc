# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export CLR_OPENSSL_VERSION_OVERRIDE=46
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet

export PATH="$HOME/.cargo/bin:$PATH"

export PATH=$PATH:~/.platformio/penv/bin

export PATH=$PATH:~/azure-functions-cli

#[ -z $DISPLAY ] && export DISPLAY=127.0.0.1:0.0

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
