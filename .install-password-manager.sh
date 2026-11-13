#!/bin/sh

set -e

export PATH="$HOME/.local/bin:$PATH"
if [ "$(uname -s)" = Darwin ]; then
    export PATH="${HOMEBREW_PREFIX:-/opt/homebrew}/bin:/usr/local/bin:$PATH"
fi

if command -v op >/dev/null 2>&1; then
    if [ "$(uname -s)" != Darwin ] || [ -d /Applications/1Password.app ] || [ -d "$HOME/Applications/1Password.app" ]; then
        exit
    fi
fi

case "$(uname -s)" in
Darwin)
    if ! command -v brew >/dev/null 2>&1; then
        echo >&2 "Installing homebrew"
        installer=$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
        /bin/bash -c "$installer"
        brew analytics off
    fi

    eval "$(brew shellenv sh)"
    brew install --cask 1password 1password-cli
    op --version >/dev/null
    ;;
Linux)
    mkdir -p "$HOME/.local/bin"
    case "$(uname -m)" in
    x86_64)
        ARCH=amd64
        ;;
    aarch64)
        ARCH=arm64
        ;;
    *)
        echo >&2 "Error: unsupported arch from uname -m: $(uname -m)"
        exit 1
        ;;
    esac
    tmpdir=$(mktemp -d -t install-package-manager.XXXXXX)
    trap 'rm -rf "$tmpdir"' EXIT INT TERM
    OP_VERSION="v$(curl https://app-updates.agilebits.com/check/1/0/CLI2/en/2.0.0/N -s | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')";
    wget "https://cache.agilebits.com/dist/1P/op2/pkg/${OP_VERSION}/op_linux_${ARCH}_${OP_VERSION}.zip" -O "$tmpdir/op.zip" &&
        unzip -d ~/.local/bin "$tmpdir/op.zip" op
    chmod +x ~/.local/bin/op
    ;;
*)
    echo "Error: unsupported OS: $(uname -s)"
    exit 1
    ;;
esac
