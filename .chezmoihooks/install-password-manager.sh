#!/bin/sh

HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"
PATH="$HOMEBREW_PREFIX/bin:$HOME/.local/bin:$PATH"

if command -v op >/dev/null 2>&1; then
    exit
fi

tmpdir=$(mktemp -d -t install-package-manager.XXXXXX)
trap 'rm -rf "$tmpdir"' EXIT INT TERM

case "$(uname -s)" in
Darwin)
    if ! [ -x "$HOMEBREW_PREFIX/bin/brew" ]; then
        echo >&2 "Installing homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
        brew analytics off
    fi

    if command -v brew >/dev/null 2>&1; then
        brew install 1password-cli
    fi
    ;;
Linux)
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
