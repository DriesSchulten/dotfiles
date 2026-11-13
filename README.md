## Personal dotfiles, OS X

Uses [chezmoi](https://www.chezmoi.io/user-guide/setup/)

To install:

```shell
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply DriesSchulten
```

On macOS, setup installs Homebrew and the 1Password CLI before applying dotfiles.
Homebrew is added to PATH in new zsh login shells and fish sessions on both Apple Silicon and Intel Macs.
After setup, open a new terminal and run `op --version` to verify the CLI is available.
For desktop app integration, sign in to 1Password and enable **Settings → Developer → Integrate with 1Password CLI**.
Enable the 1Password SSH agent manually under **Settings → Developer**; SSH configuration and vault selections are managed here.
Rex must be installed manually while it is in beta; its keybindings are managed here, and Ghostty remains available.

Setup installs all globally configured Mise tools once and synchronizes Fish plugins whenever `fish_plugins` changes.
It also installs Codebase Memory when missing and enables automatic indexing once.
On macOS, `kubectl` is provided by OrbStack rather than Helm or Kubelogin.

Installs and configures:
* [fish](https://fishshell.com) with the [fisher](https://github.com/jorgebucaran/fisher) plugin manager
* [Homebrew](http://brew.sh/) with most dev tooling I use
* Terminal setup and GIT config
