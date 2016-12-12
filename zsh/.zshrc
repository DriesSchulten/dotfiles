source ~/.zsh/fzf-setup.zsh
source ~/.zsh/zplug-setup.zsh
source ~/.zsh/zsh-opts.zsh

# Theme
ZSH_THEME="pure"

# Aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias fuck='$(thefuck $(fc -ln -1))'

export THEFUCK_REQUIRE_CONFIRMATION=false

if [[ $OSTYPE == *darwin* ]]; then
  # Editor
  export EDITOR="/usr/local/bin/atom"

  # Ruby gems
  export GEM_HOME=$HOME/.gem

  # GO
  export PATH=$PATH:/usr/local/opt/go/libexec/bin

  # Pad
  export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$GEM_HOME/bin:$PATH
else
  export EDITOR="/usr/bin/vim"
  export PATH="$PATH:$HOME/.rvm/bin"
fi
