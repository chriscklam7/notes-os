#!/usr/bin/env bash
set -euo pipefail

defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

exit 0
