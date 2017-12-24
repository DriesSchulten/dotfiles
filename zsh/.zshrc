#!/bin/zsh
source ~/.zsh/fzf-setup.zsh
source ~/.zsh/zplug-setup.zsh
source ~/.zsh/zsh-opts.zsh

# Aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias fuck='$(thefuck $(fc -ln -1))'

export THEFUCK_REQUIRE_CONFIRMATION=false

if [[ $OSTYPE == *darwin* ]]; then
  # Editor
  export EDITOR="/usr/local/bin/subl"

  # Ruby gems
  export GEM_HOME=$HOME/.gem

  # GO
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
  export GOPATH=/Users/dries/Projects/Go

  # Pad
  export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$GEM_HOME/bin:$PATH

  # Python local packages
  PYTHON_BIN="`python3 -m site --user-base`/bin"
  export PATH=$PYTHON_BIN:$PATH

  # Pyton webserver
  alias serve='python3 -m http.server 9000'
else
  export EDITOR="/usr/bin/vim"
  export PATH="$PATH:$HOME/.rvm/bin"
fi

# added by travis gem
[ -f /Users/dries/.travis/travis.sh ] && source /Users/dries/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
