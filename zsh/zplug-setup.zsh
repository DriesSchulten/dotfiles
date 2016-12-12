#!/bin/zsh
[[ -d ~/.zplug ]] || {
  curl -sL zplug.sh/installer | zsh
}

# Define OS
local OSX="[[ $OSTYPE == *darwin* ]]"

# Essential
source ~/.zplug/init.zsh

zplug "zplug/zplug"

# Plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "peterhurford/git-it-on.zsh"
zplug "mafredri/zsh-async"
zplug "robbyrussell/oh-my-zsh", use:"lib/key-bindings.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/completion.zsh"
zplug "plugins/sudo", from:oh-my-zsh, as:plugin
zplug "plugins/gradle", from:oh-my-zsh, defer:2, as:plugin
zplug "plugins/docker", from:oh-my-zsh, as:plugin
zplug "plugins/brew", from:oh-my-zsh, if:$OSX, as:plugin
zplug "plugins/brew-cask", from:oh-my-zsh, if:$OSX, defer:2, as:plugin
zplug "plugins/osx", from:oh-my-zsh, if:$OSX, defer:2, as:plugin
zplug "b4b4r07/enhancd", use:init.sh

# Local plugins
zplug "~/.zsh/conf", from:local, defer:3, if:$OSX

# Theme
zplug "sindresorhus/pure"

# Install plugins that have not been installed yet
if ! zplug check; then
    zplug install
fi

zplug load
