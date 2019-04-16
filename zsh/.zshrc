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

  # Pad
  export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$GEM_HOME/bin:$PATH

  # Python local packages
  PYTHON_BIN="`python3 -m site --user-base`/bin"
  export PATH=$PYTHON_BIN:$PATH

  # Composer bin 
  export PATH="$HOME/.composer/vendor/bin:$PATH"

  # MySQL 5.7
  export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

  # Node 10
  export PATH="/usr/local/opt/node@10/bin:$PATH"
else
  export EDITOR="/usr/bin/vim"
  export PATH="$PATH:$HOME/.rvm/bin"
fi

# added by travis gem
[ -f /Users/dries/.travis/travis.sh ] && source /Users/dries/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh