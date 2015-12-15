#!/bin/sh
if [ ! -f ~/.zsh/zgen/zgen.zsh ]; then
	mkdir ~/.zsh
  pushd ~/.zsh
  git clone https://github.com/tarjoilija/zgen.git
  popd
fi