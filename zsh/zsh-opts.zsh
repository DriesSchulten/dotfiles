#!/bin/sh

# set some history options
setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt share_history

# Prompt substitution
setopt prompt_subst

# Share your history across all your terminal windows
setopt share_history
#setopt noclobber

# set some more options
setopt pushd_ignore_dups
#setopt pushd_silent

# Keep a ton of history.
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

if [[ -f /usr/local/share/zsh/site-functions/_aws ]]; then
  source /usr/local/share/zsh/site-functions/_aws
fi

