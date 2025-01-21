#!/bin/bash
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Install homebrew
. "$DOTFILES_DIR/homebrew.sh"

# Install FISH
. "$DOTFILES_DIR/fish.sh"

# Sublime merge
. "$DOTFILES_DIR/smerge.sh"

# Link
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig-skyworkz" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig-h4h" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig-default" ~

mkdir -p ~/.config/fish
ln -sfv "$DOTFILES_DIR/fish/config.fish" ~/.config/fish/
ln -sfv "$DOTFILES_DIR/fish/fish_plugins" ~/.config/fish/

ln -sfv "$DOTFILES_DIR/starship/starship.toml" ~/.config/
ln -sfv "$DOTFILES_DIR/mise" ~/.config/mise
ln -sfv "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sfv "$DOTFILES_DIR/wezterm" ~/.config/wezterm
ln -sfv "$DOTFILES_DIR/ghostty" ~/.config/ghostty

fish "$DOTFILES_DIR/fish/fisher-setup.fish"
