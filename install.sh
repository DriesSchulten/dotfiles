#!/bin/bash
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Install stuff when on OS X
if [[ $OSTYPE == *darwin* ]]; then
  # Install homebrew
  . "$DOTFILES_DIR/homebrew.sh"

  # Install FISH
  . "$DOTFILES_DIR/fish.mac.sh"

  # Sublime
  . "$DOTFILES_DIR/sublime.sh"
  . "$DOTFILES_DIR/smerge.sh"

  # JEnv
  . "$DOTFILES_DIR/jenv.sh"
fi

# Vundle setup
. "$DOTFILES_DIR/vundle.sh"

# Link
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~

mkdir -p ~/.config/fish
ln -sfv "$DOTFILES_DIR/fish/config.fish" ~/.config/fish/
ln -sfv "$DOTFILES_DIR/fish/fish_plugins" ~/.config/fish/

fish "$DOTFILES_DIR/fish/fisher-setup.fish"

curl -sL git.io/tide | source && tide_install

if [[ $OSTYPE == *darwin* ]]; then
  # Launchctl vars
  launchctl setenv ANDROID_HOME /usr/local/share/android-sdk/
fi
