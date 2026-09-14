#!/usr/bin/env bash
set -euo pipefail

FOLDER=${1:-}
if [[ -z "$FOLDER" ]]; then
    FOLDER="."
fi

if [[ ! -d "$FOLDER" ]]; then
    echo "Error: '$FOLDER' is not a directory" >&2
    exit 1
fi

cd "$FOLDER"

echo Current directory: $FOLDER

rm -f .DS_Store
rm -f */.DS_Store
rm -f */*/.DS_Store
rm -f */*/*/.DS_Store
rm -f */*/*/*/.DS_Store
rm -f */*/*/*/*/.DS_Store

echo "DONE"

exit 0
