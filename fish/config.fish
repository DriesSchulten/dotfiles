set --export SHELL /usr/bin/fish
set --export EDITOR "subl -w"
set -e fish_greeting

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
[ -f ~/Library/autojump/autojump.txt ]; and alias j="cd (cat ~/Library/autojump/autojump.txt | sort -nr | awk '{print \$2}' | fzf +s)"

# Android
export ANDROID_HOME=/usr/local/share/android-sdk

thefuck --alias | source 

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
