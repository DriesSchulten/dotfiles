#!/bin/sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew analytics off

brew tap caskroom/cask
brew tap caskroom/versions

apps=(
  thefuck
  htop-osx
  vim
  git
  git-flow
  scala
  groovy
  python3
  gradle
  maven
  sbt
  node
  jenv
  diff-so-fancy
  cocoapods
)

cask_apps=(
	java
  iterm2
  sublime-text
  android-sdk
)

brew install "${apps[@]}"
brew cask install "${cask_apps[@]}"
