#!/bin/sh
if ! type brew > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/dries/.profile
eval "$(/opt/homebrew/bin/brew shellenv)"

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
  postman
  brisync
  lsd
  slack
  google-chrome
  firefox
  autojump
  starship
)

brew install "${apps[@]}"
