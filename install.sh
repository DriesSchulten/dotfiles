#!/bin/sh
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Install homebrew
. "$DOTFILES_DIR/homebrew.sh"

# Install ZSH
. "$DOTFILES_DIR/zsh.sh"

# Atom
. "$DOTFILES_DIR/atom.sh"

# JEnv
. "$DOTFILES_DIR/jenv.sh"

# Link
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

ln -sfv "$DOTFILES_DIR/zsh/.zshrc" ~
ln -sfv "$DOTFILES_DIR/zsh/zplug-setup.zsh" ~/.zsh
ln -sfv "$DOTFILES_DIR/zsh/zsh-opts.zsh" ~/.zsh
ln -sfv "$DOTFILES_DIR/zsh/java.zsh" ~/.zsh
