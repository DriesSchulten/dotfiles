set --export SHELL /opt/homebrew/bin/fish
set --export EDITOR "code -w"

set -U fish_greeting

eval "$(/opt/homebrew/bin/brew shellenv)"

set -g fish_user_paths "/opt/homebrew/sbin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths
set -g fish_user_paths "/Users/dries/.cargo/bin" $fish_user_paths
set -g fish_user_paths "/Users/dries/Library/Application Support/JetBrains/Toolbox/scripts" $fish_user_paths

starship init fish | source
zoxide init fish | source
pyenv init - | source

alias ls="lsd"
abbr -a lla "ls -la"
abbr -a lt "ls --tree"
