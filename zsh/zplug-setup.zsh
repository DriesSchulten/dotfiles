#!/bin/zsh
# Check if zplug is installed
[[ -d ~/.zplug ]] || {
  git clone https://github.com/b4b4r07/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
}

# Define OS
local OSX="[[ $OSTYPE == *darwin* ]]"

# Essential
source ~/.zplug/init.zsh

zplug "b4b4r07/zplug"

# Plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "peterhurford/git-it-on.zsh"
zplug "mafredri/zsh-async"
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/gradle", from:oh-my-zsh, nice:10
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh, if:$OSX
zplug "plugins/brew-cask", from:oh-my-zsh, if:$OSX, nice:10
zplug "plugins/osx", from:oh-my-zsh, if:$OSX, nice:10
zplug "b4b4r07/enhancd", use:init.sh

# Local plugins
zplug "~/.zsh/conf", from:local, nice:12, if:$OSX

# Theme
zplug "sindresorhus/pure"

# Install plugins that have not been installed yet
if ! zplug check --verbose; then
  zplug install
fi

zplug load
