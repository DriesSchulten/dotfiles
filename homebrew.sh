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
  android-sdk
)

cask_apps=(
	java
  iterm2
  atom
)

brew install "${apps[@]}"
brew cask install "${cask_apps[@]}"
