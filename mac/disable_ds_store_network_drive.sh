#!/usr/bin/env bash
set -euo pipefail

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

exit 0
