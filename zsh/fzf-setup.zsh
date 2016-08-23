#!/bin/zsh
[[ -d ~/.fzf ]] || {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export ENHANCD_FILTER=fzf
export ENHANCD_DISABLE_DOT=1
