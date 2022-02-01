#!/bin/sh
if ! type brew > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew analytics off

apps=(
  htop-osx
  vim
  git
  git-flow
  python3
  node
  cocoapods
  fzf
  terminal-notifier
  diff-so-fancy
  iterm2
  sublime-text
  sublime-merge
  android-sdk
  font-hack-nerd-font
)

brew install "${apps[@]}"
