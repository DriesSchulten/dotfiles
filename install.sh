#!/bin/bash
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Install stuff when on OS X
if [[ $OSTYPE == *darwin* ]]; then
  # Install homebrew
  . "$DOTFILES_DIR/homebrew.sh"

  # Install ZSH
  . "$DOTFILES_DIR/zsh.mac.sh"

  # Atom
  . "$DOTFILES_DIR/atom.sh"

  # JEnv
  . "$DOTFILES_DIR/jenv.sh"
else
  # Install/set ZSH
  . "$DOTFILES_DIR/zsh.linux.sh"
fi

# Link
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~

ln -sfv "$DOTFILES_DIR/zsh/.zshrc" ~
mkdir ~/.zsh
ln -sfv "$DOTFILES_DIR/zsh/zplug-setup.zsh" ~/.zsh/
ln -sfv "$DOTFILES_DIR/zsh/zsh-opts.zsh" ~/.zsh/
ln -sfv "$DOTFILES_DIR/zsh/conf" ~/.zsh/
