if [[ -x /usr/local/bin/zsh ]]; then
  export SHELL=/usr/local/bin/zsh
  exec /usr/local/bin/zsh -i
else
   # sometimes zsh is not available.
    [[ -f ~/.bashrc ]] && . ~/.bashrc
fi

