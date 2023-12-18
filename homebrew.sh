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
  neovim
  git
  python3
  node
  fzf
  terminal-notifier
  diff-so-fancy
  iterm2
  sublime-merge
  font-hack-nerd-font
  intellij-idea
  monitorcontrol
  lsd
  slack
  google-chrome
  firefox
  autojump
  starship
  visual-studio-code
)

brew install "${apps[@]}"
