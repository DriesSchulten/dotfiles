#!/bin/sh
if ! type brew > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew analytics off

brew tap caskroom/cask
brew tap caskroom/versions

apps=(
  thefuck
  htop-osx
  vim
  git
  git-flow
  python3
  maven
  sbt
  node
  jenv
  cocoapods
  fzf
  terminal-notifier
)

cask_apps=(
	java
  java8
  iterm2
  sublime-text
  sublime-merge 
  android-sdk
)

brew install "${apps[@]}"
brew cask install "${cask_apps[@]}"
