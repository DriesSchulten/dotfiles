#!/bin/sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
berw tap homebrew/completions

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
	Caskroom/cask/java
)

brew install "${apps[@]}"
brew install "${cask_apps[@]}"
