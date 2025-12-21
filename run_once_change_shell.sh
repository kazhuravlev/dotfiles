#!/usr/bin/env bash
set -e

if ! command -v fish >/dev/null 2>&1; then
  brew install fish
fi

FISH="$(command -v fish || true)"
[ -z "$FISH" ] && exit 0

if ! grep -qx "$FISH" /etc/shells; then
  echo "$FISH" | sudo tee -a /etc/shells >/dev/null
fi

if [ "$SHELL" != "$FISH" ]; then
  chsh -s "$FISH"
fi

