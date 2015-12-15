#!/bin/sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask

apps=(
  pam_yubico
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
)

cask_apps=(
	java
)

brew install "${apps[@]}"
brew cask install "${cask_apps[@]}"
