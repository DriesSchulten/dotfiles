#!/bin/sh
brew install zsh

grep "/usr/local/bin/zsh" /private/etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/zsh >> /private/etc/shells"
chsh -s /usr/local/bin/zsh
