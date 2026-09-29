#!/usr/bin/env zsh
# Wrapper shell for opencode's `shell` config (used by the bash tool).
#
# Contract: opencode invokes this as `wrapper -c "<command>" [name [args...]]`,
# matching the standard POSIX shell -c convention:
#   - "<command>" is the script text
#   - the next arg becomes $0 inside that script
#   - subsequent args become $1, $2, ...
#
# Mise activation must run in the same zsh that executes the command so
# project-local tools and shell hooks are available.

set -u

preamble='
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
'

# Handle `-c <cmd> [args...]` (and the rarely-used `-lc`, `-c -l`, etc. we
# just pass through untouched aside from -c).
if [[ "${1:-}" == "-c" && $# -ge 2 ]]; then
  cmd="$2"
  shift 2
  # $@ now holds the optional [name [args...]] that become $0, $1, ... in the
  # child. Forward them verbatim.
  exec zsh -c "${preamble}${cmd}" "$@"
fi

# Fallback for interactive shells and script files.
exec zsh "$@"
