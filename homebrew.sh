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
  git
  iterm2
  sublime-merge
  font-jetbrains-mono-nerd-font
  font-jetbrains-mono
  jetbrains-toolbox
  monitorcontrol
  eza
  fzf
  fd
  bat
  slack
  google-chrome
  firefox
  zoxide
  starship
  visual-studio-code
  wezterm
)

brew install "${apps[@]}"
