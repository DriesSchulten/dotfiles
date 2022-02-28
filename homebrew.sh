#!/bin/sh
if ! type brew > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew analytics off
brew tap homebrew/cask-fonts

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
  intellij-idea
  insomnia
  brisync
)

brew install "${apps[@]}"
