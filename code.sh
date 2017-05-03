#!/bin/bash
ln -sfv "$DOTFILES_DIR/Code/settings.json" ~/Library/Application\ Support/Code/User/settings.json
ln -sfv "$DOTFILES_DIR/Code/keybindings.json" ~/Library/Application\ Support/Code/User/keybindings.json
ln -sfv "$DOTFILES_DIR/Code/snippets/" ~/Library/Application\ Support/Code/User/snippets

for extension in `cat "$DOTFILES_DIR/Code/installed_extensions"`
do
  code --install-extension "$extension"
done
