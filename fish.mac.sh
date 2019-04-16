#!/bin/sh
brew install fish

grep "/usr/local/bin/fish" /private/etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/fish >> /private/etc/shells"
chsh -s /usr/local/bin/fish
