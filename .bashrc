# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export CLR_OPENSSL_VERSION_OVERRIDE=46
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

[ -z $DISPLAY ] && export DISPLAY=127.0.0.1:0.0

export TERM=xterm-256color
alias la='exa -la'
alias ls=exa
alias xi='sudo xbps-install -S'
alias xu='sudo xbps-install -Syu'
alias xs='xbps-query -Rs'
alias cat=bat
alias v=vim-huge
