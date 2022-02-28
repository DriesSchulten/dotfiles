#!/bin/sh
brew install fish

grep "/opt/homebrew/bin/fish" /private/etc/shells &>/dev/null || sudo bash -c "echo /opt/homebrew/bin/fish >> /private/etc/shells"
chsh -s /opt/homebrew/bin/fish
