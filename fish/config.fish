set --export SHELL /opt/homebrew/bin/fish
set --export EDITOR "subl -w"

set -U fish_greeting
set -U fish_color_command c397d8

set -g fish_user_paths "/opt/homebrew/sbin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths
set -g fish_user_paths (ruby -e 'print Gem.user_dir')/bin $fish_user_paths

export NVM_DIR="$HOME/.nvm"
export NVM_SYMLINK_CURRENT=true
 
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish
[ -f ~/Library/autojump/autojump.txt ]; and alias j="cd (cat ~/Library/autojump/autojump.txt | sort -nr | awk '{print \$2}' | fzf +s)"

# Android
export ANDROID_HOME=/opt/homebrew/share/android-sdk

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias rmf='rm -rf'