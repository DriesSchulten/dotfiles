#!/bin/sh
apm install --packages-file atom/package-list.txt

ln -sfv "$DOTFILES_DIR/atom/config.cson" ~/.atom
ln -sfv "$DOTFILES_DIR/atom/init.coffee" ~/.atom
ln -sfv "$DOTFILES_DIR/atom/keymap.cson" ~/.atom
ln -sfv "$DOTFILES_DIR/atom/snippets.cson" ~/.atom
ln -sfv "$DOTFILES_DIR/atom/styles.less" ~/.atom
