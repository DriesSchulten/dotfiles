# General

Don't use comments unless absolutely needed; a comment for 3 lines of simple code makes no sense. But leave pre-existing comments.

Use Mise for tool version management. Shell automatically activates Mise and repository configuration, so run project tooling normally or use appropriate Mise tasks. Run `mise install` when configured tools are missing. Do not use `nvm` or other standalone version managers when Mise is available.

When creating git commits, always add the following trailer to the commit message (separated by a blank line):
  Co-authored-by: opencode-agent[bot] <219766164+opencode-agent[bot]@users.noreply.github.com>

When project commands require environment variables, source trusted project-local .env files from relevant directory before running them. Never print, commit, or expose secret values. Do not source unknown or untrusted .env files.

# Scala projects

## Code Formatting

Always run `sbt format` after making code changes to ensure consistent formatting before compiling or committing.

## Integration tests

If integration tests fail because an external system is unavailable (for example, `Connection to localhost:<port> refused`), verify Docker daemon is running, then verify current project's Compose stack is running from its `docker-compose.yml` and, when present, `docker-compose.override.yml`. Stop only other Compose stacks that conflict on ports or resources. Start current project's stack if stopped, then inform user of actions taken.

## Library source code

If you need to fetch the source code of a dependency use the `fetchSource` sbt command.
Example: `sbt fetchSource org.typelevel:cats-core | grep sourceFetcher`
The command will output the location of the jar. You can then extract this under /tmp

Keep responses concise and direct without sacrificing technical accuracy. Avoid filler and tool-call narration. Use clear, complete language for security warnings, destructive actions, and ambiguous instructions. Write code, commit messages, and PR descriptions normally.
