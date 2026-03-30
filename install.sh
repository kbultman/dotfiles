#!/bin/bash
# Coder dotfiles install script
# This script is run automatically by Coder when the workspace starts.
# It symlinks dotfiles into the home directory.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Only include the alias section — Coder/workspace already provides
# credential helpers, LFS config, etc.
if [ -f "$SCRIPT_DIR/.gitconfig" ]; then
  if ! git config --global --get alias.st > /dev/null 2>&1; then
    cat "$SCRIPT_DIR/.gitconfig" >> "$HOME/.gitconfig"
    echo "dotfiles: git aliases applied"
  else
    echo "dotfiles: git aliases already present, skipping"
  fi
fi
