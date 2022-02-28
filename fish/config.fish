set --export SHELL /opt/homebrew/bin/fish
set --export EDITOR "subl -w"
set -U fish_greeting

set -g fish_user_paths "/opt/homebrew/sbin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths
set -g fish_user_paths (ruby -e 'print Gem.user_dir')/bin $fish_user_paths

[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish
[ -f ~/Library/autojump/autojump.txt ]; and alias j="cd (cat ~/Library/autojump/autojump.txt | sort -nr | awk '{print \$2}' | fzf +s)"

# Android
export ANDROID_HOME=/usr/local/share/android-sdk

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
