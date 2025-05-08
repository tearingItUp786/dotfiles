#!/usr/bin/env bash
set -euo pipefail

# Install Homebrew if not already installed
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# Run brew bundle (tilde doesn't expand in quotes — use $HOME)
BREWFILE="$HOME/.dotfiles/Brewfile"

if [[ -f "$BREWFILE" ]]; then
  echo "Installing packages from $BREWFILE..."
  brew bundle --file="$BREWFILE" --verbose
else
  echo "No Brewfile found at $BREWFILE"
  exit 1
fi

exit 0
