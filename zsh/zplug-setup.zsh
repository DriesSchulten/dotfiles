#!/bin/sh
# Check if zplug is installed
[[ -d ~/.zplug ]] || {
  curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
  source ~/.zplug/zplug && zplug update --self
}

# Essential
source ~/.zplug/zplug

zplug "b4b4r07/zplug"

# Plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search", nice:11
zplug "zsh-users/zsh-completions"
zplug "peterhurford/git-it-on.zsh"
zplug "mafredri/zsh-async"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh
zplug "plugins/gradle", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/brew-cask", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/os-x", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "junegunn/fzf-bin", as:command, from:gh-r, file:"fzf"
zplug "b4b4r07/enhancd", of:enhancd.sh

# Local plugins
zplug "~/.zsh/conf", from:local, nice:12, if:"[[ $OSTYPE == *darwin* ]]"

# Theme
zplug "sindresorhus/pure"

# Install plugins that have not been installed yet
if ! zplug check --verbose; then
  zplug install
fi

zplug load
