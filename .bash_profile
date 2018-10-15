#export LC_CTYPE=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

#export NVM_DIR="$HOME/.nvm"
#source $(brew --prefix nvm)/nvm.sh

if [[ -x /usr/local/bin/zsh ]]; then
  export SHELL=/usr/local/bin/zsh
  exec /usr/local/bin/zsh -i
else
   # sometimes zsh is not available.
    [[ -f ~/.bashrc ]] && . ~/.bashrc
fi

