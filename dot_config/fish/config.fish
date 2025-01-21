set -Ux SHELL /opt/homebrew/bin/fish
set -Ux EDITOR "zed -n --wait"

set -U fish_greeting

eval "$(/opt/homebrew/bin/brew shellenv)"

fish_add_path "/Users/dries/.cargo/bin"
fish_add_path "/Users/dries/.local/bin"
fish_add_path "/Users/dries/Library/Application Support/JetBrains/Toolbox/scripts"

starship init fish | source
zoxide init fish | source

if not status is-interactive
  mise activate fish --shims | source
end

alias ls="eza --icons=always"
abbr -a lla "ls -la"
abbr -a lt "ls --tree"
abbr -a mvn "mvn -T 1C"

alias cd="z"
