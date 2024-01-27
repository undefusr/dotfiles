#!/bin/bash

set -eufo pipefail

if ![ command -v rust >/dev/null 2>&1 ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if ![ command -v z4h >/dev/null 2>&1 ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

defaults write com.apple.dock orientation right
defaults write com.apple.dock show-recents -bool false

sudo mdutil -i off
